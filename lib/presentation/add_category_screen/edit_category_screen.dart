import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:wulap_application/category.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class EditCategoryScreen extends StatefulWidget {
  final Category category;

  EditCategoryScreen({required this.category, Key? key}) : super(key: key);

  @override
  _EditCategoryScreenState createState() => _EditCategoryScreenState();
}

class _EditCategoryScreenState extends State<EditCategoryScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController addCategoryNameSectionController =
      TextEditingController();
  TextEditingController foodNameValueSectionController =
      TextEditingController();
  final TextEditingController contributionStartedOnSectionController =
      TextEditingController();

  String? imagePath;

  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();

    // Initialize the controllers with category details
    addCategoryNameSectionController.text = widget.category.name;
    foodNameValueSectionController.text = widget.category.slots.toString();
    contributionStartedOnSectionController.text = widget.category.date;
    imagePath = widget.category.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Category'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildAddCategoryNameSection(context),
                SizedBox(height: 16.v),
                _buildFoodNameValueSection(context),
                SizedBox(height: 27.v),
                _buildContributionStartedOnSection(context),
                SizedBox(height: 16.v),
                _buildImageUploadSection(context),
                SizedBox(height: 25.v),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Edit your Food category details.",
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.v),
                _buildUpdateButtonSection(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUpdateButtonSection(BuildContext context) {
    return CustomElevatedButton(
      height: 64.v,
      text: "Update Category",
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      onPressed: () {
        onTapUpdateButtonSection(context);
      },
    );
  }

  Widget _buildAddCategoryNameSection(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        controller: addCategoryNameSectionController,
        decoration: InputDecoration(
          labelText: "Category Name",
          contentPadding: EdgeInsets.symmetric(horizontal: 16.h),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16.0),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Category Name is required';
          } else if (value.length < 3) {
            return 'Category Name should be at least 3 characters long';
          } else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
            return 'Category Name should only contain letters and spaces';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildFoodNameValueSection(BuildContext context) {
    return TextFormField(
      controller: foodNameValueSectionController,
      decoration: InputDecoration(
        labelText: "Number of Slots",
        contentPadding: EdgeInsets.symmetric(horizontal: 16.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      onChanged: (value) {
        // You may add any specific logic here if needed
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Number of Slots is required';
        } else if (!isValidNumber(value)) {
          return 'Invalid number of slots';
        }
        return null;
      },
    );
  }

  bool isValidNumber(String value) {
    try {
      int slots = int.parse(value);
      return slots > 0;
    } catch (e) {
      return false;
    }
  }

  Widget _buildContributionStartedOnSection(BuildContext context) {
    String selectedDate = contributionStartedOnSectionController.text.isEmpty
        ? 'Contribution started'
        : contributionStartedOnSectionController.text;

    return InkWell(
      onTap: () => _selectDate(context),
      child: Container(
        height: 48.0,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.normal,
                color: const Color.fromARGB(255, 40, 40, 40),
              ),
            ),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }

  Widget _buildImageUploadSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              _selectImage(context);
            },
            child: Container(
              height: 50.0,
              width: 150.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  'Upload Image',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 21, 21, 21),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16.0),
          if (imagePath != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.file(
                File(imagePath!),
                height: 130,
                width: 130,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _selectImage(BuildContext context) async {
    try {
      final XFile? selectedImage = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (selectedImage != null) {
        // Check if the selected file has a valid extension
        if (_isValidImageExtension(selectedImage.path)) {
          setState(() {
            imagePath = selectedImage.path;
          });
        } else {
          // Handle the case where the selected file is not a JPEG or PNG

          print("Invalid file format. Please choose a JPEG or PNG file.");
        }
      }
    } catch (e) {
      print('Error selecting image: $e');
    }
  }

  bool _isValidImageExtension(String filePath) {
    // Get the file extension
    String extension = filePath.split('.').last.toLowerCase();

    // Check if the extension is JPEG or PNG
    return extension == 'jpg' || extension == 'jpeg' || extension == 'png';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      String formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);

      setState(() {
        contributionStartedOnSectionController.text = formattedDate;
      });
    }
  }

  void onTapUpdateButtonSection(BuildContext context) {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;

      if (firebaseUser != null) {
        final box = Hive.box<Category>('categories_${firebaseUser.uid}');

        // Find the index of the category to be updated
        int categoryIndex = box.values
            .toList()
            .indexWhere((cat) => cat.categoryID == widget.category.categoryID);

        if (categoryIndex != -1) {
          // Validate the category name
          String categoryName = addCategoryNameSectionController.text;
          if (!isValidCategoryName(categoryName)) {
            // Display Snackbar for invalid category name
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Invalid category name. Please correct it.'),
                duration: Duration(seconds: 3),
              ),
            );
            return; // Do not proceed with the update if the category name is invalid
          }

          // Update the category details
          box.putAt(
            categoryIndex,
            Category(
              name: categoryName,
              slots: int.parse(foodNameValueSectionController.text),
              date: contributionStartedOnSectionController.text,
              imagePath: imagePath,
              categoryID: widget.category.categoryID,
            ),
          );

          print('Category updated successfully.');

          // Navigate back to the DashboardPaluwaganScreen
          Navigator.pop(context);
          Navigator.pushNamed(context, AppRoutes.dashboardPaluwaganScreen);
        } else {
          print('Category not found in the box.');
        }
      } else {
        print('User not logged in.');
      }
    } catch (e) {
      print('Error updating category: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error updating category. Please enter valid data.'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  bool isValidCategoryName(String value) {
    return RegExp(r'^[a-zA-Z\s]+$').hasMatch(value);
  }
}
