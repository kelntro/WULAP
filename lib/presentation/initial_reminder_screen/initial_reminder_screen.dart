import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_title.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class InitialReminderScreen extends StatelessWidget {
  InitialReminderScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 16.v),
                  GestureDetector(
                      onTap: () {
                        onTapDatePickerAndroid(context);
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.h),
                          decoration: AppDecoration.outlineBlack90001.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder16),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            _buildDatePickerData(context),
                            SizedBox(height: 25.v),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 31.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("lbl_s".tr,
                                          style: CustomTextStyles
                                              .titleMediumRobotoGray60001),
                                      Text("lbl_m".tr,
                                          style: CustomTextStyles
                                              .titleMediumRobotoGray60001),
                                      Text("lbl_t".tr,
                                          style: CustomTextStyles
                                              .titleMediumRobotoGray60001),
                                      Text("lbl_w".tr,
                                          style: CustomTextStyles
                                              .titleMediumRobotoGray60001),
                                      Text("lbl_t".tr,
                                          style: CustomTextStyles
                                              .titleMediumRobotoGray60001),
                                      Text("lbl_f".tr,
                                          style: CustomTextStyles
                                              .titleMediumRobotoGray60001),
                                      Text("lbl_s".tr,
                                          style: CustomTextStyles
                                              .titleMediumRobotoGray60001)
                                    ])),
                            SizedBox(height: 19.v),
                            Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 79.h, right: 31.h),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                              height: 28.v,
                                              width: 12.h,
                                              child: Stack(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  children: [
                                                    Align(
                                                        alignment: Alignment
                                                            .bottomLeft,
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 1.h),
                                                            child: Text(
                                                                "lbl_1".tr,
                                                                style: theme
                                                                    .textTheme
                                                                    .bodyLarge))),
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgIconAndroid,
                                                        height: 11.v,
                                                        width: 12.h,
                                                        alignment:
                                                            Alignment.topCenter)
                                                  ])),
                                          Spacer(flex: 19),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 9.v),
                                              child: Text("lbl_22".tr,
                                                  style: theme
                                                      .textTheme.bodyLarge)),
                                          Spacer(flex: 20),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 9.v),
                                              child: Text("lbl_32".tr,
                                                  style: theme
                                                      .textTheme.bodyLarge)),
                                          Spacer(flex: 20),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 9.v),
                                              child: Text("lbl_4".tr,
                                                  style: theme
                                                      .textTheme.bodyLarge)),
                                          Spacer(flex: 20),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 9.v),
                                              child: Text("lbl_5".tr,
                                                  style: theme
                                                      .textTheme.bodyLarge)),
                                          Spacer(flex: 20),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 9.v),
                                              child: Text("lbl_6".tr,
                                                  style: theme
                                                      .textTheme.bodyLarge))
                                        ]))),
                            SizedBox(height: 28.v),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 32.h, right: 27.h),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("lbl_7".tr,
                                          style: theme.textTheme.bodyLarge),
                                      Spacer(flex: 27),
                                      Text("lbl_8".tr,
                                          style: theme.textTheme.bodyLarge),
                                      Spacer(flex: 27),
                                      Text("lbl_9".tr,
                                          style: theme.textTheme.bodyLarge),
                                      Spacer(flex: 23),
                                      Text("lbl_10".tr,
                                          style: theme.textTheme.bodyLarge),
                                      Padding(
                                          padding: EdgeInsets.only(left: 30.h),
                                          child: Text("lbl_11".tr,
                                              style:
                                                  theme.textTheme.bodyLarge)),
                                      Spacer(flex: 22),
                                      Text("lbl_122".tr,
                                          style: theme.textTheme.bodyLarge),
                                      Padding(
                                          padding: EdgeInsets.only(left: 30.h),
                                          child: Text("lbl_13".tr,
                                              style: theme.textTheme.bodyLarge))
                                    ])),
                            SizedBox(height: 19.v),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 27.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(top: 9.v),
                                          child: Text("lbl_14".tr,
                                              style:
                                                  theme.textTheme.bodyLarge)),
                                      _buildNineteen(context,
                                          userName: "lbl_15".tr),
                                      Padding(
                                          padding: EdgeInsets.only(top: 9.v),
                                          child: Text("lbl_16".tr,
                                              style:
                                                  theme.textTheme.bodyLarge)),
                                      Padding(
                                          padding: EdgeInsets.only(top: 9.v),
                                          child: Text("lbl_17".tr,
                                              style:
                                                  theme.textTheme.bodyLarge)),
                                      Padding(
                                          padding: EdgeInsets.only(top: 9.v),
                                          child: Text("lbl_18".tr,
                                              style:
                                                  theme.textTheme.bodyLarge)),
                                      _buildNineteen(context,
                                          userName: "lbl_19".tr),
                                      Padding(
                                          padding: EdgeInsets.only(top: 9.v),
                                          child: Text("lbl_20".tr,
                                              style: theme.textTheme.bodyLarge))
                                    ])),
                            SizedBox(height: 28.v),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 27.h),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("lbl_21".tr,
                                          style: theme.textTheme.bodyLarge),
                                      Text("lbl_222".tr,
                                          style: theme.textTheme.bodyLarge),
                                      Text("lbl_23".tr,
                                          style: theme.textTheme.bodyLarge),
                                      Text("lbl_24".tr,
                                          style: theme.textTheme.bodyLarge),
                                      Text("lbl_25".tr,
                                          style: theme.textTheme.bodyLarge),
                                      Text("lbl_26".tr,
                                          style: theme.textTheme.bodyLarge),
                                      Text("lbl_27".tr,
                                          style: theme.textTheme.bodyLarge)
                                    ])),
                            SizedBox(height: 20.v),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 27.h),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(top: 8.v),
                                              child: Text("lbl_28".tr,
                                                  style: theme
                                                      .textTheme.bodyLarge)),
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  left: 30.h, top: 8.v),
                                              child: Text("lbl_29".tr,
                                                  style: theme
                                                      .textTheme.bodyLarge)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 30.h),
                                              child: _buildNineteen(context,
                                                  userName: "lbl_30".tr))
                                        ]))),
                            SizedBox(height: 72.v)
                          ]))),
                  Spacer()
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlack90002,
            margin: EdgeInsets.only(left: 24.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "msg_payment_reminder".tr));
  }

  /// Section Widget
  Widget _buildDatePickerData(BuildContext context) {
    return Container(
        width: 360.h,
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 17.v),
        decoration: AppDecoration.fillPrimary,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("lbl_2023".tr, style: CustomTextStyles.bodyLargeWhiteA700),
          SizedBox(height: 11.v),
          Text("lbl_tue_may_8".tr, style: theme.textTheme.headlineLarge)
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Common widget
  Widget _buildNineteen(
    BuildContext context, {
    required String userName,
  }) {
    return SizedBox(
        height: 28.v,
        width: 18.h,
        child: Stack(alignment: Alignment.topCenter, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Text(userName,
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: appTheme.black90001))),
          CustomImageView(
              imagePath: ImageConstant.imgIconAndroid,
              height: 11.v,
              width: 12.h,
              alignment: Alignment.topCenter)
        ]));
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

  /// Navigates to the latePaymentReminderScreen when the action is triggered.
  onTapDatePickerAndroid(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.latePaymentReminderScreen);
  }
}
