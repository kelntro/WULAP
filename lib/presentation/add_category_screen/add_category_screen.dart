import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:wulap_application/category.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class AddCategoryScreen extends StatefulWidget {
  AddCategoryScreen({Key? key}) : super(key: key);

  @override
  _AddCategoryScreenState createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  TextEditingController addCategoryNameSectionController =
      TextEditingController();
  TextEditingController foodNameValueSectionController =
      TextEditingController();
  final TextEditingController contributionStartedOnSectionController =
      TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? imagePath; // Variable to store the selected image path

  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              _buildArrowLeftSection(context),
              SizedBox(height: 16.0),
              _buildAddCategory(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBarSection(context),
      ),
    );
  }

  Widget _buildAddCategory(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: AppDecoration.fillWhiteA
          .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Add Category",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40.v),
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
                  text: "Add your Food category to manage efficiently.",
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.v),
          _buildCreateButtonSection(context),
        ],
      ),
    );
  }

  Widget _buildImageUploadSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.0), // Add padding to the top
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
        imageQuality: 80, // You can adjust the image quality
      );

      if (selectedImage != null) {
        setState(() {
          imagePath = selectedImage.path;
        });
      } else {
        // User canceled image selection
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image selection canceled'),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      // Show an error snackbar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error selecting image: $e'),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );

      print('Error selecting image: $e');
    }
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
        // You may add any logic here if needed
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

  Widget _buildContributionStartedOnSection(BuildContext context) {
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
              contributionStartedOnSectionController.text.isEmpty
                  ? 'Contribution started'
                  : contributionStartedOnSectionController.text,
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

  Widget _buildCreateButtonSection(BuildContext context) {
    return CustomElevatedButton(
      height: 64.v,
      text: "Create Category",
      margin: EdgeInsets.symmetric(horizontal: 16.h),
      onPressed: () {
        onTapCreateButtonSection(context);
      },
    );
  }

  Widget _buildArrowLeftSection(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 12.v),
      decoration: AppDecoration.fillWhiteA
          .copyWith(borderRadius: BorderRadiusStyle.customBorderTL33),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              onTapImgArrowLeft(context);
            },
            child: Container(
              height: 12.v,
              width: 15.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageConstant.imgArrowLeftBlack9000212x15),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddCategoryNameSection(BuildContext context) {
    return Container(
      width: double
          .infinity, // Set width to match the width of _buildFoodNameValueSection
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
        style: TextStyle(fontSize: 16.0), // Adjust the font size if needed
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Category Name is required';
          } else if (value.length < 3) {
            return 'Category Name should be at least 3 characters long';
          } else if (!RegExp(r'^[a-zA-Z]+(?: [a-zA-Z]+)*$').hasMatch(value)) {
            return 'Category Name should only contain letters and spaces';
          }

          return null;
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBarSection(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.buyPage;
      case BottomBarEnum.Frame1000002310:
        return "/";
      case BottomBarEnum.Frame1000002311:
        return "/";
      case BottomBarEnum.Notification:
        return "/";
      case BottomBarEnum.Settings:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.buyPage:
        return BuyPage();
      default:
        return DefaultWidget();
    }
  }

  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  void onTapCreateButtonSection(BuildContext context) async {
    try {
      if (_formKey.currentState!.validate()) {
        // Form is valid, proceed with category creation

        User? firebaseUser = FirebaseAuth.instance.currentUser;

        if (firebaseUser != null) {
          final box = Hive.box<Category>('categories_${firebaseUser.uid}');

          // Rest of your code for category creation goes here
          if (addCategoryNameSectionController.text.isEmpty ||
              foodNameValueSectionController.text.isEmpty ||
              contributionStartedOnSectionController.text.isEmpty) {
            // Display an error message using a SnackBar
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Please fill in all fields.'),
                duration: Duration(seconds: 3),
              ),
            );
            return; // Exit the method if any field is empty
          }

          // Generate a unique categoryID using the Uuid package
          final categoryID = Uuid().v4();
          print('Creating Category with the following data:');
          print('Name: ${addCategoryNameSectionController.text}');
          print('Slots: ${int.parse(foodNameValueSectionController.text)}');
          print('Date: ${contributionStartedOnSectionController.text}');
          print('ImagePath: $imagePath');
          print('CategoryID: $categoryID');

          final newCategory = Category(
            name: addCategoryNameSectionController.text,
            slots: int.parse(foodNameValueSectionController.text),
            date: contributionStartedOnSectionController.text,
            imagePath: imagePath,
            categoryID: categoryID,
          );
          box.add(newCategory);

          print('Category created successfully.');
          print(categoryID);
          Navigator.pop(context);

          Navigator.pushNamed(context, AppRoutes.dashboardPaluwaganScreen);
        } else {
          print('User not logged in.');
        }
      } else {
        // Form is not valid, display an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please fix the errors in the form.'),
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      SnackBar(
        content: Text('Error creating category. Please Enter valid data.'),
        duration: Duration(seconds: 3),
      );
    }
  }
}
