import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder_provider.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder_screen_list.dart';
import 'package:wulap_application/routes/app_routes.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';

class ReminderScreen extends StatefulWidget {
  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  late ReminderProvider _reminderProvider;
  @override
  void initState() {
    super.initState();
    _reminderProvider = ReminderProvider();
    _initializeReminderProvider();
  }

  Future<void> _initializeReminderProvider() async {
    // Initialize the ReminderProvider
    await _reminderProvider.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Reminder'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateSelector(context),
            SizedBox(height: 16),
            _buildTimeSelector(context),
            SizedBox(height: 16),
            _buildTextField(
              controller: _titleController,
              labelText: 'Title',
            ),
            SizedBox(height: 16),
            _buildTextField(
              controller: _descriptionController,
              labelText: 'Description',
            ),
          ],
        ),
      ),
      floatingActionButton: _buildFloatingActionButton(context),
      bottomNavigationBar: _buildBottomBarSection(),
    );
  }

  Widget _buildDateSelector(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.calendar_today),
          onPressed: () async {
            DateTime? selectedDate = await showDatePicker(
              context: context,
              initialDate: _selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime(2101),
            );

            if (selectedDate != null) {
              setState(() {
                _selectedDate = selectedDate;
              });
            }
          },
        ),
        Text('Date: ${DateFormat('MM-dd-yyyy').format(_selectedDate)}'),
      ],
    );
  }

  Widget _buildTimeSelector(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: Icon(Icons.access_time),
          onPressed: () async {
            TimeOfDay? selectedTime = await showTimePicker(
              context: context,
              initialTime: _selectedTime,
            );

            if (selectedTime != null) {
              setState(() {
                _selectedTime = selectedTime;
              });
            }
          },
        ),
        Text('Time: ${_selectedTime.format(context)}'),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
    );
  }

  Future<void> _saveReminder() async {
    // Perform validation and save the reminder
    if (_titleController.text.isNotEmpty) {
      String title = _titleController.text;
      String description = _descriptionController.text;

      // Combine selected date and time
      DateTime reminderDateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedTime.minute,
      );

      // Create a Reminder object
      Reminder reminder = Reminder(
        title: title,
        description: description,
        dateTime: reminderDateTime,
      );

      // Initialize the ReminderProvider (if not already initialized)
      await _initializeReminderProvider();

      // Save the reminder using the provider
      await _reminderProvider.addReminder(reminder);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RemindersListScreen()),
      );
    } else {
      // Show an error message using Snackbar if the title is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Title must not be empty.'),
        ),
      );
    }
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _saveReminder();
      },
      child: ClipOval(
        child: Container(
          height: 56,
          width: 56,
          color: Theme.of(context).primaryColor,
          child: Icon(
            Icons.save,
            color: Colors.white,
          ),
        ),
      ),
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
