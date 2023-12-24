import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_title.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class EditEventOneScreen extends StatelessWidget {
  EditEventOneScreen({Key? key}) : super(key: key);

  TextEditingController editTextController = TextEditingController();

  TextEditingController editTextController1 = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 16.v),
                child: Column(children: [
                  SizedBox(height: 94.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 53.h, right: 44.h, bottom: 5.v),
                              child: Column(children: [
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 14.v, bottom: 10.v),
                                          child: Text("lbl_event_type".tr,
                                              style: CustomTextStyles
                                                  .bodyMedium_1)),
                                      Expanded(
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 5.h),
                                              child: CustomTextFormField(
                                                  controller:
                                                      editTextController,
                                                  borderDecoration:
                                                      TextFormFieldStyleHelper
                                                          .fillPrimary,
                                                  filled: true,
                                                  fillColor: theme
                                                      .colorScheme.primary
                                                      .withOpacity(0.2))))
                                    ]),
                                SizedBox(height: 22.v),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12.v),
                                          child: Text("lbl_event_date".tr,
                                              style: CustomTextStyles
                                                  .bodyMedium_1)),
                                      Container(
                                          height: 44.v,
                                          width: 206.h,
                                          margin: EdgeInsets.only(left: 5.h),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 6.h, vertical: 7.v),
                                          decoration: AppDecoration.fillPrimary1
                                              .copyWith(
                                                  borderRadius:
                                                      BorderRadiusStyle
                                                          .roundedBorder6),
                                          child: CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgCalendar,
                                              height: 29.v,
                                              width: 27.h,
                                              alignment: Alignment.topRight,
                                              onTap: () {
                                                onTapImgCalendar(context);
                                              }))
                                    ]),
                                SizedBox(height: 22.v),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 14.v, bottom: 10.v),
                                          child: Text("lbl_event_type2".tr,
                                              style: CustomTextStyles
                                                  .bodyMedium_1)),
                                      Expanded(
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 14.h),
                                              child: CustomTextFormField(
                                                  controller:
                                                      editTextController1,
                                                  textInputAction:
                                                      TextInputAction.done,
                                                  borderDecoration:
                                                      TextFormFieldStyleHelper
                                                          .fillPrimary,
                                                  filled: true,
                                                  fillColor: theme
                                                      .colorScheme.primary
                                                      .withOpacity(0.2))))
                                    ]),
                                SizedBox(height: 309.v),
                                CustomElevatedButton(
                                    width: 153.h,
                                    text: "lbl_save".tr,
                                    onPressed: () {
                                      onTapSave(context);
                                    },
                                    alignment: Alignment.centerRight)
                              ]))))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlack90002,
            margin: EdgeInsets.only(left: 24.h, top: 16.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_date_tracking".tr));
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
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the editEventScreen when the action is triggered.
  onTapImgCalendar(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editEventScreen);
  }

  /// Navigates to the successSixScreen when the action is triggered.
  onTapSave(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.successSixScreen);
  }
}
