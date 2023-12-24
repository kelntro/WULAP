import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wulap_application/core/utils/image_constant.dart';
import 'package:wulap_application/presentation/note_screen/note.dart';
import 'package:wulap_application/presentation/note_screen/note_provider.dart';
import 'package:wulap_application/routes/app_routes.dart';
import 'package:wulap_application/theme/theme_helper.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_floating_button.dart';
import 'package:wulap_application/widgets/custom_image_view.dart';
import 'package:url_launcher/url_launcher.dart';

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  late NoteProvider noteProvider;

  @override
  void initState() {
    super.initState();
    noteProvider = Provider.of<NoteProvider>(context, listen: false);
    _initializeNoteProvider();
    noteProvider.addListener(_onNoteProviderChanged);
  }

  void _onNoteProviderChanged() {
    setState(() {
      // Trigger a rebuild when the NoteProvider changes
    });
  }

  @override
  void dispose() {
    noteProvider.removeListener(_onNoteProviderChanged); // Add this line
    super.dispose();
  }

  Future<void> _initializeNoteProvider() async {
    print('Initializing NoteProvider...');
    await noteProvider.initialize();
    print('NoteProvider initialized.');
    setState(() {}); // Trigger a rebuild after initialization
  }

  @override
  Widget build(BuildContext context) {
    print('Building NoteScreen...');
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
        automaticallyImplyLeading: false, // This will remove the back arrow
      ),
      body: noteProvider.notes.isEmpty
          ? Center(
              child: Text('No notes available.'),
            )
          : ListView.builder(
              itemCount: noteProvider.notes.length,
              itemBuilder: (context, index) {
                return _buildNoteCard(
                    context, noteProvider, noteProvider.notes[index]);
              },
            ),
      floatingActionButton: _buildFloatingActionButton(context),
      bottomNavigationBar: _buildBottomBarSection(),
    );
  }

  Widget _buildNoteCard(
      BuildContext context, NoteProvider noteProvider, Note note) {
    return Dismissible(
      key: Key(note.title),
      onDismissed: (direction) async {
        if (direction == DismissDirection.endToStart) {
          final deletedNote = note;
          final index = noteProvider.notes.indexOf(deletedNote);

          // Delete the note from the provider and Hive
          await noteProvider.deleteNote(index);

          // Show a snackbar with the option to undo the deletion
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Note deleted"),
              action: SnackBarAction(
                label: "Undo",
                onPressed: () async {
                  // Add the deleted note back to the provider and Hive
                  await noteProvider.addNote(deletedNote);
                },
              ),
            ),
          );
        }
      },
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 16.0),
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: GestureDetector(
        child: Card(
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(
              note.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              // ignore: unnecessary_null_comparison
              note.date != null
                  ? "Date: ${DateFormat('MM-dd-yyyy').format(note.date.toLocal())}"
                  : "Date not available",
              style: TextStyle(color: Colors.grey),
            ),
            trailing: ElevatedButton(
              onPressed: () => _visitLink(context, note.link),
              style: ElevatedButton.styleFrom(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Visit Link',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _visitLink(BuildContext context, String link) async {
    try {
      // ignore: deprecated_member_use
      await launch(link);
    } catch (e) {
      // Define a custom log function
      void log(String message) {
        print('[Flutter Notes] $message');
      }

      log('Error launching link: $e');
    }
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showAddNoteDialog(context);
      },
      child: ClipOval(
        child: CustomFloatingButton(
          height: 45,
          width: 45,
          backgroundColor: theme.colorScheme.primary,
          decoration: null, // Set this to null to remove the border or outline
          child: CustomImageView(
            imagePath: ImageConstant.imgAdd,
            height: 27.5,
            width: 27.5,
          ),
        ),
      ),
    );
  }

  void _showAddNoteDialog(BuildContext context) async {
    Note newNote = Note(
      title: '',
      link: '',
      date: DateTime.now(), // Initialize with the current date
    );

    TextEditingController titleController = TextEditingController();
    TextEditingController linkController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Add Note"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              _buildTextField(
                controller: titleController,
                labelText: "Title",
                onChanged: (value) {
                  print('Title changed: $value');
                  newNote.title = value;
                },
              ),
              SizedBox(height: 16),
              _buildTextField(
                controller: linkController,
                labelText: "Link",
                onChanged: (value) {
                  print('Link changed: $value');
                  newNote.link = value;
                },
              ),
              SizedBox(height: 16),
              _buildDateSelector(context, newNote),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              print('Cancel button pressed');
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              _validateAndAddNote(
                  context, newNote, titleController.text, linkController.text);
            },
            child: Text("Add Note"),
          ),
        ],
      ),
    );
  }

  void _validateAndAddNote(
      BuildContext context, Note note, String title, String link) {
    if (_isValidNoteTitle(title) && _isValidNote(note, link)) {
      print('Add Note button pressed');
      note.title = title;
      note.link = link;
      print('Adding note: $note');
      noteProvider.addNote(note);
      Navigator.pop(context);
    } else {
      // Show an error message using Snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Validation failed. Title must contain only letters, spaces, and numbers, and Link must be a valid URL.'),
        ),
      );
    }
  }

  bool _isValidNoteTitle(String title) {
    // Use a regular expression to check if the title contains only letters, spaces, and numbers
    return RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(title);
  }

  bool _isValidNote(Note note, String link) {
    return link.isNotEmpty && _isValidUrl(link);
  }

  bool _isValidUrl(String url) {
    return Uri.tryParse(url)?.isAbsolute ?? false;
  }

  Widget _buildDateSelector(BuildContext context, Note note) {
    return Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.calendar_today,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () async {
            DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: note.date,
              firstDate: DateTime(2000),
              lastDate: DateTime(2101),
            );

            if (selectedDate != null) {
              setState(() {
                note.date = selectedDate;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required void Function(String) onChanged,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      style: TextStyle(fontSize: 12.0),
      onChanged: onChanged,
    );
  }

  Widget _buildBottomBarSection() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      var currentState = navigatorKey.currentState;
      if (currentState != null) {
        try {
          String route = getCurrentRoute(type);
          currentState.pushNamed(route);
        } catch (e) {
          print("Error while navigating: $e");
        }
      } else {
        print("Error: currentState is null. Navigator state not available.");
      }
    });
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.buyPage;
      case BottomBarEnum.Frame1000002310:
      case BottomBarEnum.Frame1000002311:
      case BottomBarEnum.Notification:
      case BottomBarEnum.Settings:
        return "/";
      default:
        throw Exception("Unexpected BottomBarEnum: $type");
    }
  }
}
