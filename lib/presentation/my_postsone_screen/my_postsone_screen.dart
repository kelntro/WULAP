import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/presentation/dashboard_paluwagan_screen/dashboard_paluwagan_screen.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

class MyPostsoneScreen extends StatefulWidget {
  MyPostsoneScreen({Key? key}) : super(key: key);

  @override
  _MyPostsoneScreenState createState() => _MyPostsoneScreenState();
}

class _MyPostsoneScreenState extends State<MyPostsoneScreen> {
  DateTime? selectedDate;

  TextEditingController menuItemEditTextController = TextEditingController();
  TextEditingController categoryEditTextController = TextEditingController();
  TextEditingController linkEditTextController = TextEditingController();
  TextEditingController linkEditText2Controller = TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers when the widget is disposed
    menuItemEditTextController.dispose();
    categoryEditTextController.dispose();
    linkEditTextController.dispose();
    linkEditText2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: _buildBody(context),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.myPostsScreen);
        },
      ),
      centerTitle: true,
      title: Text(
        "lbl_post_tracking".tr,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 48.v),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 88.v),
            _buildMenuItem(context),
            SizedBox(height: 22.v),
            _buildCategory(context),
            SizedBox(height: 22.v),
            _buildDatePostedRow(context),
            SizedBox(height: 22.v),
            _buildLink(context),
            Spacer(),
            _buildSaveButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItemButton(BuildContext context) {
    return Container(
      width: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(6),
        color: appTheme.blueGray10001,
      ),
      child: Text(
        "lbl_menu_item2".tr,
        style: theme.textTheme.bodyMedium!,
      ),
    );
  }

  Widget _buildMenuItemEditText(BuildContext context) {
    return CustomTextFormField(
      width: 230.h,
      controller: menuItemEditTextController,
      hintText: "Your Hint Text Here",
      hintStyle: theme.textTheme.bodyMedium!,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
      borderDecoration: TextFormFieldStyleHelper.outlineBlackTL6,
      filled: true,
      fillColor: appTheme.whiteA700,
    );
  }

  Widget _buildMenuItem(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildMenuItemButton(context),
          _buildMenuItemEditText(context),
        ],
      ),
    );
  }

  Widget _buildCategoryEditText(BuildContext context) {
    return Container(
      width: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(6),
        color: appTheme.blueGray10001,
      ),
      child: Text(
        "lbl_category2".tr,
        style: theme.textTheme.bodyMedium!,
      ),
    );
  }

  Widget _buildSortEditText(BuildContext context) {
    return CustomTextFormField(
      width: 230.h,
      controller: categoryEditTextController,
      suffixConstraints: BoxConstraints(maxHeight: 44.v),
      borderDecoration: TextFormFieldStyleHelper.outlineBlackTL6,
      filled: true,
      fillColor: appTheme.whiteA700,
    );
  }

  Widget _buildCategory(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCategoryEditText(context),
          _buildSortEditText(context),
        ],
      ),
    );
  }

  Widget _buildDatePostedButton(BuildContext context) {
    return Container(
      width: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(6),
        color: appTheme.blueGray10001,
      ),
      child: Text(
        "lbl_date_posted2".tr,
        style: theme.textTheme.bodyMedium!,
      ),
    );
  }

  Widget _buildDatePostedRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildDatePostedButton(context),
          GestureDetector(
            onTap: () async {
              // Show the calendar picker when the image is tapped
              DateTime? pickedDate = await _selectDate(context);

              // Update the selectedDate variable and trigger a rebuild
              if (pickedDate != null) {
                setState(() {
                  selectedDate = pickedDate;
                });
              }
            },
            child: CustomImageView(
              imagePath: ImageConstant.imgCalendar,
              height: 29.v,
              width: 27.h,
              alignment: Alignment.topRight,
            ),
          ),
          // Display the selected date in a container
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: selectedDate != null
                ? Text(
                    '${_formatDate(selectedDate!)}',
                    style: TextStyle(fontSize: 16),
                  )
                : Text(
                    'No Date Selected',
                    style: TextStyle(fontSize: 16),
                  ),
          ),
        ],
      ),
    );
  }

  // Function to format the date
  String _formatDate(DateTime date) {
    return DateFormat('MM-dd-yyyy').format(date);
  }

  // Updated function to return the selected date
  Future<DateTime?> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      // Do something with the selected date
      print('Selected date: $pickedDate');
    }

    return pickedDate;
  }

  Widget _buildLinkEditText(BuildContext context) {
    return Container(
      width: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
        borderRadius: BorderRadius.circular(6),
        color: appTheme.blueGray10001,
      ),
      child: Text(
        "lbl_link2".tr,
        style: theme.textTheme.bodyMedium!,
      ),
    );
  }

  Widget _buildLinkEditText2(BuildContext context) {
    return CustomTextFormField(
      width: 230.h,
      controller: linkEditText2Controller,
      textInputAction: TextInputAction.done,
      hintText: "Your Hint Text Here",
      hintStyle: theme.textTheme.bodyMedium!,
      contentPadding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
      borderDecoration: TextFormFieldStyleHelper.outlineBlackTL6,
      filled: true,
      fillColor: appTheme.whiteA700,
    );
  }

  Widget _buildLink(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 2.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildLinkEditText(context),
          _buildLinkEditText2(context),
        ],
      ),
    );
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

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

  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.buyPage:
        return BuyPage();
      default:
        return DefaultWidget();
    }
  }

  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  onTapImgCalendar(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.dateScreen);
  }

  onTapSaveButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.successScreen);
  }

  Widget _buildSaveButton(BuildContext context) {
    return CustomElevatedButton(
      height: 36,
      width: 153.h,
      text: "lbl_save".tr,
      margin: EdgeInsets.only(right: 19.h),
      onPressed: () {
        saveToFirebase();
      },
      alignment: Alignment.centerRight,
    );
  }

  void saveToFirebase() async {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;

      if (firebaseUser != null) {
        String userId = firebaseUser.uid;

        // Validate input fields before updating Firebase
        bool isMenuItemValid = menuItemEditTextController.text.isNotEmpty;
        bool isCategoryValid = categoryEditTextController.text.isNotEmpty;
        bool isDatePostedValid = selectedDate != null;
        bool isLinkValid = linkEditText2Controller.text.isNotEmpty;

        if (isMenuItemValid &&
            isCategoryValid &&
            isDatePostedValid &&
            isLinkValid) {
          // Convert input values to a map
          Map<String, dynamic> postData = {
            'menuItem': menuItemEditTextController.text,
            'category': categoryEditTextController.text,
            'datePosted': selectedDate?.toLocal().toString(),
            'link': linkEditText2Controller.text,
          };

          // Get a reference to the user's posts collection
          CollectionReference postsCollection = FirebaseFirestore.instance
              .collection('Users')
              .doc(userId)
              .collection('postTracking');

          // Add the post to the collection
          await postsCollection.add(postData);

          print('Post saved successfully!');
        } else {
          print('Failed to save post: Invalid input(s)');
        }
      } else {
        print('Error: User is not authenticated');
      }
    } catch (error) {
      print('Failed to save post: $error');
    }
  }
}
