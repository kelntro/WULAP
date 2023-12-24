import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_floating_text_field.dart';
import 'package:wulap_application/widgets/custom_icon_button.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ProfSaveScreen extends StatelessWidget {
  ProfSaveScreen({Key? key}) : super(key: key);

  TextEditingController fullNameController = TextEditingController();

  TextEditingController relationshipController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController addressController1 = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      Container(
                          height: 48.v,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: appTheme.whiteA700,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(33.h)))),
                      SizedBox(height: 5.v),
                      Container(
                          padding: EdgeInsets.all(20.h),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder30),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            SizedBox(height: 16.v),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant
                                          .imgArrowLeftBlueGray80024x24,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                      onTap: () {
                                        onTapImgArrowLeft(context);
                                      }),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 111.h, bottom: 2.v),
                                      child: Text("lbl_next_of_kin".tr,
                                          style: CustomTextStyles
                                              .bodyLargeDMSansBluegray800_1))
                                ])),
                            SizedBox(height: 30.v),
                            SizedBox(
                                height: 64.v,
                                width: 66.h,
                                child: Stack(
                                    alignment: Alignment.topRight,
                                    children: [
                                      CustomImageView(
                                          imagePath:
                                              ImageConstant.imgEllipse4664x64,
                                          height: 64.adaptSize,
                                          width: 64.adaptSize,
                                          radius: BorderRadius.circular(32.h),
                                          alignment: Alignment.centerLeft),
                                      CustomIconButton(
                                          height: 24.adaptSize,
                                          width: 24.adaptSize,
                                          padding: EdgeInsets.all(4.h),
                                          decoration: IconButtonStyleHelper
                                              .fillPrimaryTL12,
                                          alignment: Alignment.topRight,
                                          child: CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgBxBxsCameraPlus))
                                    ])),
                            SizedBox(height: 36.v),
                            _buildFullName(context),
                            SizedBox(height: 10.v),
                            _buildRelationship(context),
                            SizedBox(height: 2.v),
                            _buildSixtyThree(context),
                            SizedBox(height: 12.v),
                            _buildEmail(context),
                            SizedBox(height: 12.v),
                            _buildAddress(context),
                            SizedBox(height: 12.v),
                            _buildAddress1(context),
                            SizedBox(height: 24.v),
                            _buildSave(context)
                          ]))
                    ]))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return CustomTextFormField(
        controller: fullNameController,
        hintText: "lbl_full_name".tr,
        hintStyle: CustomTextStyles.bodyLargeDMSansBluegray800_1);
  }

  /// Section Widget
  Widget _buildRelationship(BuildContext context) {
    return CustomFloatingTextField(
        controller: relationshipController,
        labelText: "lbl_relationship".tr,
        labelStyle: CustomTextStyles.bodyLargeDMSansBluegray800_1,
        hintText: "lbl_relationship".tr,
        contentPadding: EdgeInsets.fromLTRB(16.h, 16.v, 16.h, 14.v));
  }

  /// Section Widget
  Widget _buildSixtyThree(BuildContext context) {
    return SizedBox(
        height: 61.v,
        width: 350.h,
        child: Stack(alignment: Alignment.bottomRight, children: [
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  height: 61.v,
                  width: 350.h,
                  child: Stack(alignment: Alignment.topLeft, children: [
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.h, vertical: 14.v),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 1.v),
                                  child: Text("lbl_63".tr,
                                      style: CustomTextStyles
                                          .bodyLargeDMSansBluegray800_1)),
                              CustomImageView(
                                  imagePath: ImageConstant.imgArrowDown,
                                  height: 24.adaptSize,
                                  width: 24.adaptSize,
                                  margin: EdgeInsets.only(left: 9.h))
                            ]))),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                            padding: EdgeInsets.only(left: 21.h),
                            child: Text("lbl_mobile_no_2".tr,
                                style: CustomTextStyles.bodySmallPurpleA700)))
                  ]))),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                  padding: EdgeInsets.only(right: 10.h, bottom: 17.v),
                  child: Text("msg_enter_phone_number".tr,
                      style: CustomTextStyles.bodyLargeBluegray800)))
        ]));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        controller: emailController,
        hintText: "lbl_email2".tr,
        hintStyle: CustomTextStyles.bodyLargeDMSansBluegray800_1,
        textInputType: TextInputType.emailAddress);
  }

  /// Section Widget
  Widget _buildAddress(BuildContext context) {
    return CustomFloatingTextField(
        controller: addressController,
        labelText: "lbl_postal_address".tr,
        labelStyle: CustomTextStyles.bodyLargeDMSansBluegray800_1,
        hintText: "lbl_postal_address".tr,
        contentPadding: EdgeInsets.fromLTRB(16.h, 14.v, 16.h, 16.v));
  }

  /// Section Widget
  Widget _buildAddress1(BuildContext context) {
    return CustomTextFormField(
        controller: addressController1,
        hintText: "msg_physical_address".tr,
        hintStyle: CustomTextStyles.bodyLargeDMSansBluegray800_1,
        textInputAction: TextInputAction.done);
  }

  /// Section Widget
  Widget _buildSave(BuildContext context) {
    return CustomElevatedButton(
        width: 153.h,
        text: "lbl_save".tr,
        onPressed: () {
          onTapSave(context);
        },
        alignment: Alignment.centerRight);
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
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

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the successSevenScreen when the action is triggered.
  onTapSave(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.successSevenScreen);
  }
}
