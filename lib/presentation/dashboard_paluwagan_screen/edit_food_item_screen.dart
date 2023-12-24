import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:wulap_application/presentation/dashboard_paluwagan_screen/FoodListNotifier.dart';
import 'package:wulap_application/presentation/data/food_menu.dart';
import 'package:wulap_application/presentation/data/member.dart';

class EditFoodItemScreen extends StatefulWidget {
  final FoodMenu food;
  final FoodListNotifier foodListNotifier;
  final String? imagePath; // Add this line

  EditFoodItemScreen({
    required this.food,
    required this.foodListNotifier,
    this.imagePath, // Add this line
  });

  @override
  _EditFoodItemScreenState createState() => _EditFoodItemScreenState();
}

class _EditFoodItemScreenState extends State<EditFoodItemScreen> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _foodNameController = TextEditingController();
  final List<Member> _members = [];
  File? _image;

  late FoodListNotifier _foodListNotifier;

  @override
  void initState() {
    super.initState();
    _priceController.text = widget.food.totalPrice.toString();
    _startDateController.text = widget.food.startDate;
    _foodNameController.text = widget.food.menuNames.join(', ');
    _members.addAll(widget.food.members);

    _foodListNotifier = widget.foodListNotifier;
    if (widget.imagePath != null) {
      _image = File(widget.imagePath!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Food Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Food Name
              TextFormField(
                controller: _foodNameController,
                decoration: InputDecoration(
                  labelText: 'Food Name',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),

              SizedBox(height: 16),

              // Price
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),

              SizedBox(height: 16),

              // Start Date
              TextFormField(
                controller: _startDateController,
                onTap: () => _pickStartDate(),
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(16),
                ),
              ),

              SizedBox(height: 16),

              // Display added members
              if (_members.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Added Members:',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: _members.map((member) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text(member.name[0]),
                          ),
                          title: Text(member.name),
                          trailing: GestureDetector(
                            onTap: () {
                              setState(() {
                                _members.remove(member);
                              });
                            },
                            child: Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                          ),
                          onTap: () => _showMemberDetails(member),
                        );
                      }).toList(),
                    ),
                  ],
                )
              else
                SizedBox(height: 16),

              // Display picked image
              if (_image != null)
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: FileImage(_image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

              SizedBox(height: 16),

              // Pick Image Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _pickImage();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 50, 1, 86),
                    minimumSize: Size(double.infinity, 0),
                    fixedSize: Size.fromHeight(35.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    // Adjust the padding as needed
                    child: Text(
                      'Pick Image',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16),

              // Save Changes Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _saveChanges();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    minimumSize: Size(double.infinity, 0),
                    fixedSize: Size.fromHeight(35.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    // Adjust the padding as needed
                    child: Text(
                      'Save Changes',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickStartDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      final formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);
      _startDateController.text = formattedDate;
    }
  }

  Future<void> _editMember(Member member) async {
    await showDialog(
      context: context,
      builder: (context) => _buildMemberEditDialog(member),
    );
  }

  AlertDialog _buildMemberEditDialog(Member editedMember) {
    TextEditingController contributionDateController = TextEditingController(
      text: _formatContributionDate(editedMember.contributionDate),
    );

    return AlertDialog(
      title: Text("Edit Member"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            _buildMemberTextField("Name", editedMember.name,
                (value) => editedMember.name = value),
            _buildMemberTextField("Email", editedMember.email,
                (value) => editedMember.email = value),
            _buildMemberTextField("Phone Number", editedMember.phoneNumber,
                (value) => editedMember.phoneNumber = value),
            _buildMemberTextField("Address", editedMember.address,
                (value) => editedMember.address = value),
            _buildMemberTextField("Facebook Name", editedMember.facebookName,
                (value) => editedMember.facebookName = value),
            _buildMemberTextField("Receiver Month", editedMember.monthRecieve,
                (value) => editedMember.monthRecieve = value),
            TextFormField(
              controller: contributionDateController,
              decoration: InputDecoration(labelText: "Contribution Date"),
              readOnly: true,
              onTap: () => _pickContributionDate(contributionDateController),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              // Update the original member in the _members list
              int index = _members.indexOf(editedMember);
              if (index != -1) {
                _members[index] = editedMember;
                // Update the contribution date
                try {
                  editedMember.contributionDate = DateFormat('MM-dd-yyyy')
                      .parseStrict(contributionDateController.text);
                } catch (e) {
                  // Handle parsing error
                  print("Error parsing contribution date: $e");
                }
              }
            });
            Navigator.pop(context);
          },
          child: Text("Save Changes"),
        ),
      ],
    );
  }

  Future<void> _pickContributionDate(TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      final formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);
      controller.text = formattedDate;
    }
  }

  Widget _buildMemberTextField(
      String label, String? initialValue, Function(String) onChanged) {
    return TextField(
      controller: TextEditingController(text: initialValue ?? ''),
      decoration: InputDecoration(labelText: label),
      onChanged: onChanged,
    );
  }

  Future<void> _showMemberDetails(Member member) async {
    // Show the member details and options to edit or remove the member
    await showDialog(
      context: context,
      builder: (context) => _buildMemberDetailsDialog(member),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  AlertDialog _buildMemberDetailsDialog(Member member) {
    return AlertDialog(
      title: Text("Member Details"),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Name: ${member.name}"),
          SizedBox(height: 8),
          Text("Email: ${member.email}"),
          SizedBox(height: 8),
          Text("Phone Number: ${member.phoneNumber}"),
          SizedBox(height: 8),
          Text("Address: ${member.address}"),
          SizedBox(height: 8),
          Text("Facebook Name: ${member.facebookName}"),
          SizedBox(height: 8),
          Text("Receiver Month: ${member.monthRecieve}"),
          SizedBox(height: 8),
          Text(
              "Contribution Date: ${_formatContributionDate(member.contributionDate)}"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Close"),
        ),
        TextButton(
          onPressed: () async {
            // Edit the member
            await _editMember(member);
            Navigator.pop(context);
          },
          child: Text("Edit"),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              // Remove the member from the _members list
              _members.remove(member);
            });
            Navigator.pop(context);
          },
          child: Text("Remove"),
        ),
      ],
    );
  }

  String _formatContributionDate(DateTime contributionDate) {
    // Format the contribution date as needed
    return DateFormat('MM-dd-yyyy').format(contributionDate);
  }

  void _saveChanges() async {
    try {
      double newPrice = double.parse(_priceController.text);
      List<String> newMenuNames = _foodNameController.text.split(', ');

      print("Before update - Image Path: ${widget.food.imagePath}");

      // Update the food item using the notifier
      widget.food.totalPrice = newPrice;
      widget.food.startDate = _startDateController.text;
      widget.food.menuNames = newMenuNames;
      widget.food.members = _members;
      widget.food.imagePath = _image?.path;

      await _foodListNotifier.updateFoodItem(
        widget.food,
        newPrice,
        _startDateController.text,
        _members,
        newMenuNames,
        image: _image,
      );

      print("After update - Image Path: ${widget.food.imagePath}");

      // Wait for the food list to be updated
      await _foodListNotifier.fetchFoodList(widget.food.categoryID);

      Navigator.pop(context); // Close the screen
    } catch (error) {
      // Handle errors, e.g., show an error message
      print("Error saving changes: $error");
    }
  }
}
