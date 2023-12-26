import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:wulap_application/presentation/dashboard_paluwagan_screen/FoodListNotifier.dart';
import 'package:wulap_application/presentation/data/food_menu.dart';
import 'package:wulap_application/presentation/data/member.dart';

class FoodMenuInputScreen extends StatefulWidget {
  final String categoryID;

  FoodMenuInputScreen({required this.categoryID});
  @override
  _FoodMenuInputScreenState createState() => _FoodMenuInputScreenState();
}

class _FoodMenuInputScreenState extends State<FoodMenuInputScreen> {
  final TextEditingController totalPriceController = TextEditingController();
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController contributionDateController =
      TextEditingController();
  final List<Member> members = [];
  final FoodListNotifier _foodListNotifier = FoodListNotifier();
  File? _image;
  int decimalDigitsEntered = 0;

  List<String> menuNames = [];

  Future<void> _getImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        // Check if the selected file has a valid extension
        if (_isValidImageExtension(pickedFile.path)) {
          _image = File(pickedFile.path);
        } else {
          // Handle the case where the selected file is not a JPEG or PNG
          // You can show an error message or perform any other necessary action
          print("Invalid file format. Please choose a JPEG or PNG file.");
        }
      }
    });
  }

  bool _isValidImageExtension(String filePath) {
    // Get the file extension
    String extension = filePath.split('.').last.toLowerCase();

    // Check if the extension is JPEG or PNG
    return extension == 'jpg' || extension == 'jpeg' || extension == 'png';
  }

  Future<void> _pickStartDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != DateTime.now()) {
      // Format the date using intl package
      final formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);

      startDateController.text = formattedDate;
    }
  }

  void _addMember() async {
    final Member? newMember = await _showAddMemberDialog();

    if (newMember != null) {
      setState(() {
        members.add(newMember);
      });
    }
  }

  Future<Member?> _showAddMemberDialog() async {
    TextEditingController contributionDateController = TextEditingController(
      text: DateFormat('MM-dd-yyyy').format(DateTime.now()),
    );

    List<String> updatedMonthsList = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ];

    Member newMember = Member(
      name: '',
      email: '',
      phoneNumber: '',
      address: '',
      facebookName: '',
      monthRecieve: updatedMonthsList[0],
      contributionDate: DateTime.now(),
    );

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController facebookNameController = TextEditingController();

    bool canceled = false;

    await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text("Add Member"),
              content: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(labelText: "Name"),
                      style: TextStyle(fontSize: 12.0),
                      onChanged: (value) => newMember.name = value,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: "Email"),
                      style: TextStyle(fontSize: 12.0),
                      onChanged: (value) => newMember.email = value,
                    ),
                    TextField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(labelText: "Phone Number"),
                      style: TextStyle(fontSize: 12.0),
                      onChanged: (value) => newMember.phoneNumber = value,
                    ),
                    TextField(
                      controller: addressController,
                      decoration: InputDecoration(labelText: "Address"),
                      style: TextStyle(fontSize: 12.0),
                      onChanged: (value) => newMember.address = value,
                    ),
                    TextField(
                      controller: facebookNameController,
                      decoration: InputDecoration(labelText: "Facebook Name"),
                      style: TextStyle(fontSize: 14.0),
                      onChanged: (value) => newMember.facebookName = value,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 8.0), // Adjust the top padding as needed
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Month Receiver',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            DropdownButton<String>(
                              value: newMember.monthRecieve,
                              items: getDropdownItems(updatedMonthsList),
                              onChanged: (String? newValue) {
                                setState(() {
                                  // Move the selected month to the top of the list
                                  updatedMonthsList.remove(newValue);
                                  updatedMonthsList.insert(1, newValue!);
                                  newMember.monthRecieve = newValue;
                                  // Manually update the controller text
                                  contributionDateController.text =
                                      _formatContributionDate(
                                          newMember.contributionDate);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: contributionDateController,
                      decoration:
                          InputDecoration(labelText: "Contribution Date"),
                      style: TextStyle(fontSize: 14.0),
                      readOnly: true,
                      onTap: () =>
                          _pickContributionDate(contributionDateController),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    canceled = true;
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    if (!RegExp(r'^[a-zA-Z. ]+$').hasMatch(newMember.name)) {
                      _showErrorDialog(
                          'Please enter a valid member name with letters, spaces, and dots only.');
                      return null;
                    }

                    if (!RegExp(
                      r'^(?!.*@mail\.com$)[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$',
                    ).hasMatch(newMember.email)) {
                      _showErrorDialog('Please enter a valid email address.');
                      return null;
                    }

                    if (!validatePhoneNumber(newMember.phoneNumber)) {
                      _showErrorDialog(
                          'Please enter a valid Philippine phone number.');
                      return null;
                    }

                    if (!RegExp(r'^[a-zA-Z. ]+$')
                        .hasMatch(newMember.facebookName)) {
                      _showErrorDialog(
                          'Please enter a valid Facebook account without numbers or special characters.');
                      return null;
                    }

                    newMember.name = nameController.text;
                    newMember.email = emailController.text;
                    newMember.phoneNumber = phoneNumberController.text;
                    newMember.address = addressController.text;
                    newMember.facebookName = facebookNameController.text;

                    try {
                      newMember.contributionDate = DateFormat('MM-dd-yyyy')
                          .parseStrict(contributionDateController.text);
                    } catch (e) {
                      // Handle parsing error
                      print("Error parsing contribution date: $e");
                      return;
                    }
                    if (!canceled) {
                      newMember.name = nameController.text;
                      newMember.email = emailController.text;
                      newMember.phoneNumber = phoneNumberController.text;
                      newMember.address = addressController.text;
                      newMember.facebookName = facebookNameController.text;

                      try {
                        newMember.contributionDate = DateFormat('MM-dd-yyyy')
                            .parseStrict(contributionDateController.text);
                      } catch (e) {
                        // Handle parsing error
                        print("Error parsing contribution date: $e");
                        return;
                      }

                      Navigator.pop(context, newMember);
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: Text("Save Member"),
                ),
              ],
            );
          },
        );
      },
    );

    return canceled ? null : newMember;
  }

  String _formatContributionDate(DateTime date) {
    return DateFormat('MM-dd-yyyy').format(date);
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<String>> getDropdownItems(List<String> items) {
    return items.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  Future<void> _pickContributionDate(TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);
      controller.text = formattedDate;
    }
  }

  bool _isValidMemberName(String value) {
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(value);
  }

  bool validatePhoneNumber(String phoneNumber) {
    RegExp regex = RegExp(r'^(09|\+639)\d{9}$');
    if (phoneNumber.startsWith('9')) {
      regex = RegExp(r'^9\d{9}$');
    } else if (phoneNumber.startsWith('09')) {
      regex = RegExp(r'^09\d{9}$');
    }
    return regex.hasMatch(phoneNumber);
  }

  void _showMemberDetails(Member member) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
            Text("Month Receiver: ${member.monthRecieve}"),
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
        ],
      ),
    );
  }

  Future<void> _saveFoodMenu(BuildContext context, String categoryID) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    Box<FoodMenu>? boxFoodMenu;
    try {
      String foodMenuKey = Uuid().v4();

      // Validate each menu name
      for (String menuName in menuNames) {
        if (!_isValidInput(menuName)) {
          // Display an error message
          Navigator.pop(context);
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("Invalid menu name: $menuName"),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("OK"),
                  ),
                ],
              );
            },
          );
          return;
        }
      }

      final FoodMenu foodMenu = FoodMenu(
        menuNames: List.from(menuNames),
        totalPrice: double.parse(totalPriceController.text),
        startDate: startDateController.text,
        members: List.from(members),
        categoryID: widget.categoryID,
        key: foodMenuKey,
        isDeleted: false,
      );

      if (_image != null) {
        foodMenu.imagePath = _image!.path;
      }

      boxFoodMenu = await Hive.openBox<FoodMenu>('foodMenus');
      await boxFoodMenu.add(foodMenu);

      print('UUID Key for the new FoodMenu: $foodMenuKey');
      print('Food menu added to Hive: $foodMenu');

      // Refresh only the list for the current category and wait for it to complete
      await _foodListNotifier.refreshFoodList(categoryID);

      // Clear the form or reset the state
      setState(() {
        totalPriceController.clear();
        startDateController.clear();
        members.clear();
        menuNames.clear();
        _image = null;
      });

      // Close the box if it's not null
      boxFoodMenu.close();

      // Close the loading indicator
      Navigator.pop(context);
      Navigator.pop(context, true); // Navigate back to the previous screen
    } catch (error) {
      print("Error saving food menu: $error");
      if (boxFoodMenu != null) {
        await boxFoodMenu.close();
      }
      Navigator.pop(context);

      // Display an error message to the user
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error"),
            content: Text("An error occurred while saving the food menu."),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  bool _isValidInput(String value) {
    // Use a regular expression to check if the input contains only letters and spaces
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    bool isMenuNamesValid = menuNames.isNotEmpty;
    bool isStartDateValid = startDateController.text.isNotEmpty;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Paluwagan",
        ), // Use a consistent color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Container(
              child: _image != null
                  ? Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                          width: 100,
                          height: 100,
                        ),
                      ),
                    )
                  : SizedBox(height: 0),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _getImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 50, 1, 86),
                // Adjust the height of the button
                fixedSize: Size.fromHeight(35.0),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.all(8.0), // Adjust the padding as needed
                child: Text(
                  'Upload Image',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            // Dynamic input for menu names
            DynamicInputList(
              title: 'Menu Names',
              items: menuNames,
              onItemsChanged: (List<String> updatedItems) {
                setState(() {
                  menuNames = updatedItems;
                });
              },
            ),

            SizedBox(height: 16),

            TextFormField(
              controller: totalPriceController,
              decoration: InputDecoration(
                labelText: 'Amount',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
              ],
              onChanged: (value) {
                if (isValidNumber(value)) {
                  // Check if the entered value is a whole number
                  if (value.endsWith('.') || value.contains('.')) {
                    // Limit the display to two decimal places after the decimal point
                    double amount = double.parse(value);
                    String formattedValue = amount.toStringAsFixed(2);

                    // If the entered value is a whole number, add .00
                    if (amount % 1 == 0) {
                      formattedValue = amount.toStringAsFixed(2);
                    }

                    totalPriceController.value =
                        totalPriceController.value.copyWith(
                      text: formattedValue,
                      selection: TextSelection.collapsed(
                          offset: formattedValue.length),
                    );
                  }
                } else {
                  // Handle invalid input (optional)
                }
              },
            ),

            SizedBox(height: 16),
            TextFormField(
              controller: startDateController,
              decoration: InputDecoration(
                labelText: 'Start Date',
                border: OutlineInputBorder(), // Use a consistent border
              ),
              readOnly: true,
              onTap: _pickStartDate,
            ),
            SizedBox(height: 16),
            // Display added members
            if (members.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Added Members:',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 8),
                  Column(
                    children: members.asMap().entries.map((entry) {
                      final int index = entry.key;
                      final Member member = entry.value;

                      return ListTile(
                        title: Text(member.name),
                        trailing: GestureDetector(
                          onTap: () {
                            setState(() {
                              members.removeAt(index);
                            });
                          },
                          child: CircleAvatar(
                            radius: 8, // Set the desired radius value
                            backgroundColor:
                                const Color.fromARGB(255, 50, 1, 86),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 10, // Set the desired icon size
                            ),
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

            ElevatedButton(
              onPressed: _addMember,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 50, 1, 86),
                fixedSize: Size.fromHeight(35.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Add Member',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed:
                  members.isNotEmpty && isMenuNamesValid && isStartDateValid
                      ? () async {
                          await _saveFoodMenu(context, widget.categoryID);
                        }
                      : null, // Disable button if conditions are not met
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                fixedSize: Size.fromHeight(35.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  'Save Food Menu',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool isValidNumber(String value) {
  // You can add more sophisticated validation logic if needed
  try {
    double.parse(value);
    return true;
  } catch (e) {
    return false;
  }
}

class DynamicInputList extends StatefulWidget {
  final String title;
  final List<String> items;
  final Function(List<String>) onItemsChanged;

  DynamicInputList({
    required this.title,
    required this.items,
    required this.onItemsChanged,
  });

  @override
  _DynamicInputListState createState() => _DynamicInputListState();
}

class _DynamicInputListState extends State<DynamicInputList> {
  late TextEditingController _textController;
  List<String> _currentItems = [];

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _currentItems = List.from(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title),
        SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: _currentItems.map((item) {
            return Chip(
              label: Text(item),
              onDeleted: () {
                setState(() {
                  _currentItems.remove(item);
                  widget.onItemsChanged(_currentItems);
                });
              },
            );
          }).toList(),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Add ${widget.title.toLowerCase()}',
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                final newItem = _textController.text.trim();
                if (_isValidInput(newItem) &&
                    newItem.isNotEmpty &&
                    !_currentItems.contains(newItem)) {
                  setState(() {
                    _currentItems.add(newItem);
                    _textController.clear();
                    widget.onItemsChanged(_currentItems);
                  });
                } else {
                  // Display a Snackbar for invalid input
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Invalid input. Please enter letters and spaces only.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ],
    );
  }

  bool _isValidInput(String value) {
    // Use a regular expression to check if the input contains only letters and spaces
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(value);
  }
}
