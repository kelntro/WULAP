import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/firebase_service.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:image_picker/image_picker.dart';

class DashboardoneScreen extends StatefulWidget {
  DashboardoneScreen({Key? key}) : super(key: key);

  @override
  _DashboardoneScreenState createState() => _DashboardoneScreenState();
}

class _DashboardoneScreenState extends State<DashboardoneScreen> {
  String? _imagePath;
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: 748.v,
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 7.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 18.h, vertical: 34.v),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFlagSection(context),
                      SizedBox(height: 12.v),
                      _buildCategoryASection(context),
                      SizedBox(height: 13.v),
                      Padding(
                        padding: EdgeInsets.only(left: 2.h),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "msg_contribution_started".tr,
                                style: CustomTextStyles
                                    .titleMediumOnErrorContainerBold,
                              ),
                              TextSpan(
                                text: "lbl_oct_5_2023".tr,
                                style: CustomTextStyles.titleMediumPurpleA700,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(height: 8.v),
                      Padding(
                        padding: EdgeInsets.only(left: 11.h),
                        child: Text(
                          "lbl_menu".tr,
                          style: CustomTextStyles.titleMediumBlack90002,
                        ),
                      ),
                      SizedBox(height: 4.v),
                      Padding(
                        padding: EdgeInsets.only(left: 6.h),
                        child: Text(
                          "lbl_add_your_menu".tr,
                          style: CustomTextStyles.titleMediumOnErrorContainer,
                        ),
                      ),
                      SizedBox(height: 9.v),
                      _buildFloatingIconSection(context),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.only(left: 5.h),
                        child: Text(
                          "lbl_slots_12".tr,
                          style: CustomTextStyles.titleMediumBlack90002,
                        ),
                      ),
                      SizedBox(height: 3.v),
                      Padding(
                        padding: EdgeInsets.only(left: 7.h),
                        child: Text(
                          "msg_month_open_12".tr,
                          style: CustomTextStyles.titleMediumOnErrorContainer,
                        ),
                      ),
                      SizedBox(height: 78.v),
                      CustomElevatedButton(
                        height: 43.v,
                        text: "lbl_save".tr,
                        margin: EdgeInsets.only(left: 5.h, right: 3.h),
                        buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                        onPressed: () {
                          onTapSave(
                              context,
                              ModalRoute.of(context)?.settings.arguments
                                  as Map<String, dynamic>);
                        },
                      ),
                      SizedBox(height: 16.v),
                      CustomElevatedButton(
                        height: 43.v,
                        text: "lbl_cancel".tr,
                        margin: EdgeInsets.only(left: 5.h, right: 3.h),
                        buttonStyle: CustomButtonStyles.fillGray,
                        buttonTextStyle:
                            CustomTextStyles.titleSmallBluegray40077,
                        onPressed: () {
                          onTapCancel(context);
                        },
                      ),
                      SizedBox(height: 16.v),
                    ],
                  ),
                ),
              ),
              _buildArrowLeftSection(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBarSection(context),
      ),
    );
  }

  Widget _buildArrowLeftSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 12.v),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.customBorderTL33,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(height: 12.v),
          CustomImageView(
            imagePath: ImageConstant.imgArrowLeftBlack9000212x15,
            height: 12.v,
            width: 15.h,
            onTap: () {
              onTapImgArrowLeft(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFlagSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFlagSection(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 134.h, vertical: 52.v),
        decoration: AppDecoration.outlineDeepPurpleA.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(height: 21.v),
            _imagePath != null
                ? Container(
                    margin: EdgeInsets.only(left: 9.h),
                    child: Image.network(
                      _imagePath!,
                      height: 76.v,
                      width: 90.h,
                      fit: BoxFit.cover,
                    ),
                  )
                : CustomImageView(
                    imagePath: ImageConstant.imgFlag,
                    height: 76.v,
                    width: 90.h,
                    margin: EdgeInsets.only(left: 9.h),
                  ),
            SizedBox(height: 6.v),
            Text(
              "lbl_add_a_picture".tr,
              style: CustomTextStyles.bodySmallPurple100,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryASection(BuildContext context) {
    return Container(
      height: 31.v,
      width: 329.h,
      margin: EdgeInsets.only(left: 2.h),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 1.h),
              child: Text(
                "lbl_category_a".tr,
                style: CustomTextStyles.titleLargeDMSansBluegray800,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(width: 329.h, child: Divider()),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgEdit02,
            height: 21.v,
            width: 20.h,
            alignment: Alignment.topRight,
            onTap: () {
              onTapImgEditTwo(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingIconSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFloatingIconSection(context);
      },
      child: Container(
        width: 338.h,
        margin: EdgeInsets.only(left: 2.h),
        padding: EdgeInsets.symmetric(horizontal: 155.h, vertical: 4.v),
        decoration: AppDecoration.fillPurple.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 1.v),
            CustomImageView(
              imagePath: ImageConstant.imgFloatingIcon,
              height: 24.v,
              width: 22.h,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBarSection(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {
        Navigator.pushNamed(
          navigatorKey.currentContext!,
          getCurrentRoute(type),
        );
      },
    );
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

  onTapFlagSection(BuildContext context) async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String imageUrl = await FirebaseService.uploadImage(pickedFile.path);
      setState(() {
        _imagePath = imageUrl; // Update _imagePath with the new value
      });
    }
  }

  onTapImgEditTwo(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editNameScreen);
  }

  onTapFloatingIconSection(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addMenuScreen);
  }

  void onTapSave(
      BuildContext context, Map<String, dynamic> categoryData) async {
    try {
      // Access the data from categoryData and save it to Firebase
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) {
        print('Error: User is not authenticated');
        return;
      }

      CollectionReference foodCategoriesCollection = FirebaseFirestore.instance
          .collection('Users')
          .doc(firebaseUser.uid)
          .collection('foodCategories');

      await foodCategoriesCollection.add({
        'categoryName': categoryData['categoryName'],
        'slots': categoryData['slots'],
        'contributionStarted': categoryData['contributionStarted'],
        'categoryImgUrl': _imagePath ?? '', // Use the correct variable here
        'menuImageUrl': categoryData['menuImageUrl'],
        'menuName': categoryData['menuName'],
        'description': categoryData['description'],
        'price': categoryData['price'],
      });
    } catch (error) {
      print('Error adding menu to Firebase: $error');
    }
  }

  Future<void> saveDataToFirestore() async {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) {
        print('Error: User is not authenticated');
        return;
      }

      CollectionReference foodCategoriesCollection = FirebaseFirestore.instance
          .collection('Users')
          .doc(firebaseUser.uid)
          .collection('foodCategories');

      await foodCategoriesCollection.add({
        'categoryImgUrl': _imagePath ?? '', // Use the correct variable here
      });
    } catch (error) {
      print('Error adding menu to Firebase: $error');
    }
  }

  onTapCancel(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.dashboardPaluwaganScreen);
  }

  onTapImgArrowLeft(BuildContext context) {
    Navigator.popUntil(
      context,
      ModalRoute.withName(AppRoutes.addCategoryScreen),
    );
  }
}
