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
class NotificationDetailsThreeScreen extends StatelessWidget {
  NotificationDetailsThreeScreen({Key? key}) : super(key: key);

  TextEditingController editTextController = TextEditingController();

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
                padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 48.v),
                child: Column(children: [
                  SizedBox(height: 35.v),
                  _buildReminderType(context),
                  SizedBox(height: 32.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 6.h),
                          child: Text("msg_reminder_details".tr,
                              style: CustomTextStyles.bodyMedium_1))),
                  SizedBox(height: 35.v),
                  _buildWidget(context),
                  SizedBox(height: 22.v),
                  _buildEditText(context),
                  SizedBox(height: 22.v),
                  _buildDateAndTime(context),
                  Spacer(),
                  CustomElevatedButton(
                      width: 153.h,
                      text: "lbl_next".tr,
                      margin: EdgeInsets.only(right: 19.h),
                      onPressed: () {
                        onTapNext(context);
                      },
                      alignment: Alignment.centerRight)
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
        title: AppbarTitle(text: "lbl_create_reminder".tr));
  }

  /// Section Widget
  Widget _buildReminderType(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 14.v, bottom: 11.v),
              child: Text("lbl_reminder_type".tr,
                  style: CustomTextStyles.bodyMedium_1)),
          Container(
              height: 44.v,
              width: 216.h,
              padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.v),
              decoration: AppDecoration.fillBluegray10001
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
              child: CustomImageView(
                  imagePath: ImageConstant.imgSort,
                  height: 24.v,
                  width: 29.h,
                  alignment: Alignment.centerRight,
                  onTap: () {
                    onTapImgSort(context);
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildWidget(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 11.v, bottom: 13.v),
                  child: Text("lbl_group".tr,
                      style: CustomTextStyles.bodyMedium_1)),
              Container(
                  height: 44.v,
                  width: 268.h,
                  margin: EdgeInsets.only(left: 22.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.v),
                  decoration: AppDecoration.fillBluegray10001
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgSort,
                      height: 24.v,
                      width: 29.h,
                      alignment: Alignment.centerRight))
            ]));
  }

  /// Section Widget
  Widget _buildEditText(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 12.v),
              child:
                  Text("lbl_event".tr, style: CustomTextStyles.bodyMedium_1)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: 21.h),
                  child: CustomTextFormField(
                      controller: editTextController,
                      textInputAction: TextInputAction.done,
                      borderDecoration: TextFormFieldStyleHelper.fillBlueGray,
                      filled: true,
                      fillColor: appTheme.blueGray10001.withOpacity(0.56))))
        ]));
  }

  /// Section Widget
  Widget _buildDateAndTime(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 12.v),
              child: Text("lbl_date_and_time".tr,
                  style: CustomTextStyles.bodyMedium_1)),
          Container(
              height: 44.v,
              width: 216.h,
              padding: EdgeInsets.symmetric(horizontal: 17.h, vertical: 7.v),
              decoration: AppDecoration.fillBluegray10001
                  .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
              child: CustomImageView(
                  imagePath: ImageConstant.imgCalendar,
                  height: 29.v,
                  width: 27.h,
                  alignment: Alignment.topRight))
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
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the notificationDetailsScreen when the action is triggered.
  onTapImgSort(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationDetailsScreen);
  }

  /// Navigates to the enableAutomaticRemindersScreen when the action is triggered.
  onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.enableAutomaticRemindersScreen);
  }
}
