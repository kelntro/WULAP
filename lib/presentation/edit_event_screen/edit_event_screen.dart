import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_title.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class EditEventScreen extends StatelessWidget {
  EditEventScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(vertical: 16.v),
                child: Column(children: [
                  SizedBox(height: 79.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(
                                  left: 14.h, right: 14.h, bottom: 5.v),
                              child: Column(children: [
                                _buildEventType(context),
                                SizedBox(height: 92.v),
                                CustomElevatedButton(
                                    width: 153.h,
                                    text: "lbl_save".tr,
                                    margin: EdgeInsets.only(right: 29.h),
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
  Widget _buildEventType(BuildContext context) {
    return SizedBox(
        height: 408.v,
        width: 361.h,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(left: 39.h, top: 15.v, right: 29.h),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                          padding: EdgeInsets.only(top: 14.v, bottom: 10.v),
                          child: Text("lbl_event_type".tr,
                              style: CustomTextStyles.bodyMedium_1)),
                      Container(
                          height: 44.v,
                          width: 206.h,
                          margin: EdgeInsets.only(left: 5.h),
                          decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(6.h)))
                    ]),
                    SizedBox(height: 22.v),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.v),
                          child: Text("lbl_event_date".tr,
                              style: CustomTextStyles.bodyMedium_1)),
                      Container(
                          height: 44.v,
                          width: 206.h,
                          margin: EdgeInsets.only(left: 5.h),
                          decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(6.h)))
                    ]),
                    SizedBox(height: 22.v),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(
                          padding: EdgeInsets.only(top: 14.v, bottom: 10.v),
                          child: Text("lbl_event_type2".tr,
                              style: CustomTextStyles.bodyMedium_1)),
                      Container(
                          height: 44.v,
                          width: 206.h,
                          margin: EdgeInsets.only(left: 14.h),
                          decoration: BoxDecoration(
                              color: theme.colorScheme.primary.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(6.h)))
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
                              text21: "lbl_14".tr,
                              text22: "lbl_15".tr,
                              text23: "lbl_16".tr,
                              text24: "lbl_17".tr,
                              text25: "lbl_18".tr,
                              text26: "lbl_19".tr,
                              text27: "lbl_20".tr),
                          SizedBox(height: 28.v),
                          _buildTwentyOne(context,
                              text21: "lbl_21".tr,
                              text22: "lbl_222".tr,
                              text23: "lbl_23".tr,
                              text24: "lbl_24".tr,
                              text25: "lbl_25".tr,
                              text26: "lbl_26".tr,
                              text27: "lbl_27".tr),
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
    required String text21,
    required String text22,
    required String text23,
    required String text24,
    required String text25,
    required String text26,
    required String text27,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(text21,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001)),
      Text(text22,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001)),
      Text(text23,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001)),
      Text(text24,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001)),
      Text(text25,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001)),
      Text(text26,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001)),
      Text(text27,
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

  /// Navigates to the successSixScreen when the action is triggered.
  onTapSave(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.successSixScreen);
  }
}
