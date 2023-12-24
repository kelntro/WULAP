import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/set_a_screen/widgets/menu.dart';

class UpdateRowScreen extends StatefulWidget {
  @override
  _UpdateRowScreenState createState() => _UpdateRowScreenState();
}

class _UpdateRowScreenState extends State<UpdateRowScreen> {
  TextEditingController lechonController = TextEditingController();
  TextEditingController crispySkinController = TextEditingController();

  // Variable to hold the selected image file
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Row'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text fields for updating the text
            TextField(
              controller: lechonController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 8.0),
            TextField(
              controller: crispySkinController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16.0),

            // Image picker or widget for updating the image
            GestureDetector(
              onTap: () {
                _pickImage(); // Call function to pick an image
              },
              child: selectedImage != null
                  ? Image.file(
                      selectedImage!,
                      height: 50.v,
                      width: 49.h,
                      fit: BoxFit.cover,
                    )
                  : CustomImageView(
                      imagePath: ImageConstant.imgEllipse581,
                      height: 50.v,
                      width: 49.h,
                      radius: BorderRadius.circular(25.h),
                      alignment: Alignment.topCenter,
                    ),
            ),

            SizedBox(height: 16.0),

            // Save button to update the row
            ElevatedButton(
              onPressed: () {
                // Get the updated data
                var updatedData = RowData(
                  name: lechonController.text,
                  description: crispySkinController.text,
                  imagePath: '',
                );

                // Return the updated data to the previous screen
                Navigator.pop(context, updatedData);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }
}
