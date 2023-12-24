import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_title.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class NotificationDetailsOneScreen extends StatelessWidget {
  NotificationDetailsOneScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 55.v),
                child: Column(children: [
                  SizedBox(height: 27.v),
                  _buildSortStack(context),
                  SizedBox(height: 92.v),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                          padding: EdgeInsets.only(right: 88.h),
                          child: Text("lbl_next".tr,
                              style: CustomTextStyles.titleMediumGray100)))
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
  Widget _buildSortStack(BuildContext context) {
    return SizedBox(
        height: 411.v,
        width: 361.h,
        child: Stack(alignment: Alignment.topLeft, children: [
          Align(
              alignment: Alignment.topRight,
              child: Container(
                  height: 44.v,
                  width: 216.h,
                  margin: EdgeInsets.only(right: 11.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.h, vertical: 10.v),
                  decoration: AppDecoration.fillBluegray10001
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgSort,
                      height: 24.v,
                      width: 29.h,
                      alignment: Alignment.centerRight))),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 16.h, top: 14.v),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("lbl_reminder_type".tr,
                            style: CustomTextStyles.bodyMedium_1),
                        SizedBox(height: 43.v),
                        Text("msg_reminder_details".tr,
                            style: CustomTextStyles.bodyMedium_1)
                      ]))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 16.h, right: 11.h, bottom: 104.v),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.h, vertical: 10.v),
                              decoration: AppDecoration.fillBluegray10001
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder6),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgSort,
                                  height: 24.v,
                                  width: 29.h,
                                  alignment: Alignment.centerRight))
                        ]),
                    SizedBox(height: 22.v),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.v),
                          child: Text("lbl_event".tr,
                              style: CustomTextStyles.bodyMedium_1)),
                      Opacity(
                          opacity: 0.6,
                          child: Container(
                              height: 44.v,
                              width: 273.h,
                              margin: EdgeInsets.only(left: 21.h),
                              decoration: BoxDecoration(
                                  color:
                                      appTheme.blueGray10001.withOpacity(0.56),
                                  borderRadius: BorderRadius.circular(6.h))))
                    ]),
                    SizedBox(height: 22.v),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 12.v),
                              child: Text("lbl_date_and_time".tr,
                                  style: CustomTextStyles.bodyMedium_1)),
                          Container(
                              height: 44.v,
                              width: 216.h,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 17.h, vertical: 7.v),
                              decoration: AppDecoration.fillBluegray10001
                                  .copyWith(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder6),
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgCalendar,
                                  height: 29.v,
                                  width: 27.h,
                                  alignment: Alignment.topRight))
                        ])
                  ]))),
          Align(
              alignment: Alignment.center,
              child: Container(
                  decoration: AppDecoration.outlineBlack90001.copyWith(
                      borderRadius: BorderRadiusStyle.roundedBorder16),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                        width: 360.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 17.v),
                        decoration: AppDecoration.fillPrimary,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("lbl_2023".tr,
                                  style: CustomTextStyles.bodyLargeWhiteA700),
                              SizedBox(height: 10.v),
                              Text("lbl_tue_dec_8".tr,
                                  style: theme.textTheme.headlineLarge)
                            ])),
                    SizedBox(height: 25.v),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 27.h),
                        child: Column(children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.h),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("lbl_s".tr,
                                        style: CustomTextStyles
                                            .titleMediumRobotoPrimary),
                                    Text("lbl_m".tr,
                                        style: CustomTextStyles
                                            .titleMediumRobotoPrimary),
                                    Text("lbl_t".tr,
                                        style: CustomTextStyles
                                            .titleMediumRobotoPrimary),
                                    Text("lbl_w".tr,
                                        style: CustomTextStyles
                                            .titleMediumRobotoPrimary),
                                    Text("lbl_t".tr,
                                        style: CustomTextStyles
                                            .titleMediumRobotoPrimary),
                                    Text("lbl_f".tr,
                                        style: CustomTextStyles
                                            .titleMediumRobotoPrimary),
                                    Text("lbl_s".tr,
                                        style: CustomTextStyles
                                            .titleMediumRobotoPrimary)
                                  ])),
                          SizedBox(height: 28.v),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                  padding:
                                      EdgeInsets.only(left: 53.h, right: 4.h),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text("lbl_1".tr,
                                            style: theme.textTheme.bodyLarge),
                                        Spacer(flex: 20),
                                        Text("lbl_22".tr,
                                            style: theme.textTheme.bodyLarge),
                                        Spacer(flex: 19),
                                        Text("lbl_32".tr,
                                            style: theme.textTheme.bodyLarge),
                                        Spacer(flex: 19),
                                        Text("lbl_4".tr,
                                            style: theme.textTheme.bodyLarge),
                                        Spacer(flex: 19),
                                        Text("lbl_5".tr,
                                            style: theme.textTheme.bodyLarge),
                                        Spacer(flex: 19),
                                        Text("lbl_6".tr,
                                            style: theme.textTheme.bodyLarge)
                                      ]))),
                          SizedBox(height: 28.v),
                          Padding(
                              padding: EdgeInsets.only(left: 5.h),
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
                                            style: theme.textTheme.bodyLarge)),
                                    Spacer(flex: 22),
                                    Text("lbl_122".tr,
                                        style: theme.textTheme.bodyLarge),
                                    Padding(
                                        padding: EdgeInsets.only(left: 30.h),
                                        child: Text("lbl_13".tr,
                                            style: theme.textTheme.bodyLarge))
                                  ])),
                          SizedBox(height: 28.v),
                          _buildTwentyOne(context,
                              label21: "lbl_14".tr,
                              label22: "lbl_15".tr,
                              label23: "lbl_16".tr,
                              label24: "lbl_17".tr,
                              label25: "lbl_18".tr,
                              label26: "lbl_19".tr,
                              label27: "lbl_20".tr),
                          SizedBox(height: 28.v),
                          _buildTwentyOne(context,
                              label21: "lbl_21".tr,
                              label22: "lbl_222".tr,
                              label23: "lbl_23".tr,
                              label24: "lbl_24".tr,
                              label25: "lbl_25".tr,
                              label26: "lbl_26".tr,
                              label27: "lbl_27".tr),
                          SizedBox(height: 28.v),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Row(children: [
                                Text("lbl_28".tr,
                                    style: theme.textTheme.bodyLarge),
                                Padding(
                                    padding: EdgeInsets.only(left: 30.h),
                                    child: Text("lbl_29".tr,
                                        style: theme.textTheme.bodyLarge)),
                                Padding(
                                    padding: EdgeInsets.only(left: 30.h),
                                    child: Text("lbl_30".tr,
                                        style: theme.textTheme.bodyLarge))
                              ]))
                        ])),
                    SizedBox(height: 19.v)
                  ])))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Common widget
  Widget _buildTwentyOne(
    BuildContext context, {
    required String label21,
    required String label22,
    required String label23,
    required String label24,
    required String label25,
    required String label26,
    required String label27,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(label21,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001)),
      Text(label22,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001)),
      Text(label23,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001)),
      Text(label24,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001)),
      Text(label25,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001)),
      Text(label26,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001)),
      Text(label27,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001))
    ]);
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
}
