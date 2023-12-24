import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_drop_down.dart';
import 'package:wulap_application/widgets/custom_icon_button.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class BasicInfoScreen extends StatelessWidget {
  BasicInfoScreen({Key? key}) : super(key: key);

  TextEditingController firstNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  List<String> dropdownItemList1 = ["Item One", "Item Two", "Item Three"];

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
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.h, vertical: 36.v),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder30),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
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
                                          left: 86.h, bottom: 2.v),
                                      child: Text("msg_basic_information".tr,
                                          style: CustomTextStyles
                                              .bodyLargeDMSansBluegray800_1))
                                ])),
                            SizedBox(height: 26.v),
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
                            SizedBox(height: 20.v),
                            CustomTextFormField(
                                controller: firstNameController,
                                hintText: "lbl_first_name".tr,
                                hintStyle: CustomTextStyles
                                    .bodyLargeDMSansBluegray800_1),
                            SizedBox(height: 12.v),
                            CustomTextFormField(
                                controller: nameController,
                                hintText: "lbl_middle_name".tr,
                                hintStyle: CustomTextStyles
                                    .bodyLargeDMSansBluegray800_1),
                            SizedBox(height: 12.v),
                            CustomTextFormField(
                                controller: lastNameController,
                                hintText: "lbl_last_name".tr,
                                hintStyle: CustomTextStyles
                                    .bodyLargeDMSansBluegray800_1,
                                textInputAction: TextInputAction.done),
                            SizedBox(height: 12.v),
                            CustomDropDown(
                                icon: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        30.h, 14.v, 16.h, 14.v),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgArrowDown,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize)),
                                hintText: "lbl_gender".tr,
                                items: dropdownItemList,
                                onChanged: (value) {}),
                            SizedBox(height: 12.v),
                            CustomDropDown(
                                icon: Container(
                                    margin: EdgeInsets.fromLTRB(
                                        30.h, 14.v, 16.h, 14.v),
                                    child: CustomImageView(
                                        imagePath: ImageConstant.imgArrowDown,
                                        height: 24.adaptSize,
                                        width: 24.adaptSize)),
                                hintText: "lbl_marital_status".tr,
                                items: dropdownItemList1,
                                onChanged: (value) {}),
                            SizedBox(height: 13.v),
                            _buildProfileBasicComponentSeven(context),
                            SizedBox(height: 13.v)
                          ]))
                    ]))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildProfileBasicComponentSeven(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 13.v),
        decoration: AppDecoration.outlinePurpleA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(bottom: 2.v),
              child: Text("lbl_date_of_birth".tr,
                  style: CustomTextStyles.bodyLargeDMSansBluegray800_1)),
          CustomImageView(
              imagePath: ImageConstant.imgBxBxCalendar,
              height: 24.adaptSize,
              width: 24.adaptSize)
        ]));
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
}
