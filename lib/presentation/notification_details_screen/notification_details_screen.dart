import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_title.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_outlined_button.dart';

// ignore_for_file: must_be_immutable
class NotificationDetailsScreen extends StatelessWidget {
  NotificationDetailsScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 25.h, vertical: 48.v),
                child: Column(children: [
                  SizedBox(height: 35.v),
                  _buildReminderTypeRow(context),
                  _buildPaymentDeadlineReminderStack(context),
                  SizedBox(height: 22.v),
                  _buildDateAndTimeRow(context),
                  Spacer(),
                  _buildNextButton(context)
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
  Widget _buildReminderTypeRow(BuildContext context) {
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
                  alignment: Alignment.centerRight))
        ]));
  }

  /// Section Widget
  Widget _buildPaymentDeadlineReminderButton(BuildContext context) {
    return CustomOutlinedButton(
        width: 216.h,
        text: "msg_payment_deadline3".tr,
        buttonStyle: CustomButtonStyles.outlineBlack,
        alignment: Alignment.topRight);
  }

  /// Section Widget
  Widget _buildOrderDeliveryReminderButton(BuildContext context) {
    return CustomOutlinedButton(
        width: 216.h,
        text: "msg_order_delivery_reminder".tr,
        margin: EdgeInsets.only(top: 43.v),
        alignment: Alignment.topRight);
  }

  /// Section Widget
  Widget _buildLatePaymentReminderButton(BuildContext context) {
    return CustomOutlinedButton(
        width: 216.h,
        text: "msg_late_payment_reminder".tr,
        margin: EdgeInsets.only(bottom: 67.v),
        alignment: Alignment.bottomRight);
  }

  /// Section Widget
  Widget _buildGroupContributionReminderButton(BuildContext context) {
    return CustomOutlinedButton(
        width: 216.h,
        text: "msg_group_contribution".tr,
        margin: EdgeInsets.only(bottom: 25.v),
        buttonStyle: CustomButtonStyles.outlineBlackBL6,
        alignment: Alignment.bottomRight);
  }

  /// Section Widget
  Widget _buildPaymentDeadlineReminderStack(BuildContext context) {
    return SizedBox(
        height: 197.v,
        width: 334.h,
        child: Stack(alignment: Alignment.bottomRight, children: [
          Opacity(
              opacity: 0.6,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      height: 44.v,
                      width: 273.h,
                      decoration: BoxDecoration(
                          color: appTheme.blueGray10001.withOpacity(0.56),
                          borderRadius: BorderRadius.circular(6.h))))),
          Opacity(
              opacity: 0.6,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      height: 44.v,
                      width: 268.h,
                      margin: EdgeInsets.only(bottom: 66.v),
                      decoration: BoxDecoration(
                          color: appTheme.blueGray10001.withOpacity(0.56),
                          borderRadius: BorderRadius.circular(6.h))))),
          _buildPaymentDeadlineReminderButton(context),
          _buildOrderDeliveryReminderButton(context),
          _buildLatePaymentReminderButton(context),
          _buildGroupContributionReminderButton(context),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(top: 32.v),
                  child: Text("msg_reminder_details".tr,
                      style: CustomTextStyles.bodyMedium_1))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 12.v),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: Text("lbl_group".tr,
                                style: CustomTextStyles.bodyMedium_1)),
                        SizedBox(height: 48.v),
                        Text("lbl_event".tr,
                            style: CustomTextStyles.bodyMedium_1)
                      ])))
        ]));
  }

  /// Section Widget
  Widget _buildDateAndTimeRow(BuildContext context) {
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
                  alignment: Alignment.topRight,
                  onTap: () {
                    onTapImgCalendar(context);
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildNextButton(BuildContext context) {
    return CustomElevatedButton(
        width: 153.h,
        text: "lbl_next".tr,
        margin: EdgeInsets.only(right: 19.h),
        onPressed: () {
          onTapNextButton(context);
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
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the notificationDetailsOneScreen when the action is triggered.
  onTapImgCalendar(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationDetailsOneScreen);
  }

  /// Navigates to the enableAutomaticRemindersScreen when the action is triggered.
  onTapNextButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.enableAutomaticRemindersScreen);
  }
}
