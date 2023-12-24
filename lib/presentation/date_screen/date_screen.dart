import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_title.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class DateScreen extends StatelessWidget {
  DateScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                height: 664.v,
                width: double.maxFinite,
                padding: EdgeInsets.only(left: 14.h, top: 78.v, right: 14.h),
                child: Stack(alignment: Alignment.topCenter, children: [
                  _buildMenuItem(context),
                  _buildDatePickerAndroid1(context)
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
        title: AppbarTitle(text: "lbl_post_tracking".tr));
  }

  /// Section Widget
  Widget _buildMenuItem(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding: EdgeInsets.only(left: 12.h, top: 58.v, right: 12.h),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
                    decoration: AppDecoration.fillBluegray10001.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder6),
                    child: Text("lbl_menu_item2".tr,
                        style: theme.textTheme.bodyMedium)),
                Opacity(
                    opacity: 0.6,
                    child: Container(
                        height: 44.v,
                        width: 230.h,
                        margin: EdgeInsets.only(left: 8.h),
                        decoration: BoxDecoration(
                            color: appTheme.whiteA700.withOpacity(0.56),
                            borderRadius: BorderRadius.circular(6.h),
                            border: Border.all(
                                color: appTheme.black90002.withOpacity(0.56),
                                width: 1.h))))
              ]),
              SizedBox(height: 22.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    padding: EdgeInsets.all(10.h),
                    decoration: AppDecoration.fillBluegray10001.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder6),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 3.v),
                          Text("lbl_category2".tr,
                              style: theme.textTheme.bodyMedium)
                        ])),
                Container(
                    height: 44.v,
                    width: 230.h,
                    margin: EdgeInsets.only(left: 8.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 9.v),
                    decoration: AppDecoration.outlineBlack900021.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder6),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgSort,
                        height: 24.v,
                        width: 29.h,
                        alignment: Alignment.centerRight))
              ]),
              SizedBox(height: 22.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.h, vertical: 12.v),
                    decoration: AppDecoration.fillBluegray10001.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder6),
                    child: Text("lbl_date_posted2".tr,
                        style: theme.textTheme.bodyMedium)),
                Container(
                    height: 44.v,
                    width: 230.h,
                    margin: EdgeInsets.only(left: 8.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.h, vertical: 6.v),
                    decoration: AppDecoration.outlineBlack900021.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder6),
                    child: CustomImageView(
                        imagePath: ImageConstant.imgCalendar,
                        height: 29.v,
                        width: 27.h,
                        alignment: Alignment.topRight))
              ]),
              SizedBox(height: 22.v),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.h, vertical: 12.v),
                    decoration: AppDecoration.fillBluegray10001.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder6),
                    child: Text("lbl_link2".tr,
                        style: theme.textTheme.bodyMedium)),
                Opacity(
                    opacity: 0.6,
                    child: Container(
                        height: 44.v,
                        width: 230.h,
                        margin: EdgeInsets.only(left: 8.h),
                        decoration: BoxDecoration(
                            color: appTheme.whiteA700.withOpacity(0.56),
                            borderRadius: BorderRadius.circular(6.h),
                            border: Border.all(
                                color: appTheme.black90002.withOpacity(0.56),
                                width: 1.h))))
              ])
            ])));
  }

  /// Section Widget
  Widget _buildDatePickerAndroid1(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            margin: EdgeInsets.only(right: 1.h),
            decoration: AppDecoration.outlineBlack90001
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder16),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                  width: 360.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 17.v),
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("lbl_s".tr,
                                  style: CustomTextStyles
                                      .titleMediumRobotoPrimary),
                              Padding(
                                  padding: EdgeInsets.only(left: 36.h),
                                  child: Text("lbl_m".tr,
                                      style: CustomTextStyles
                                          .titleMediumRobotoPrimary)),
                              Padding(
                                  padding: EdgeInsets.only(left: 36.h),
                                  child: Text("lbl_t".tr,
                                      style: CustomTextStyles
                                          .titleMediumRobotoPrimary)),
                              Padding(
                                  padding: EdgeInsets.only(left: 36.h),
                                  child: Text("lbl_w".tr,
                                      style: CustomTextStyles
                                          .titleMediumRobotoPrimary)),
                              Padding(
                                  padding: EdgeInsets.only(left: 35.h),
                                  child: Text("lbl_t".tr,
                                      style: CustomTextStyles
                                          .titleMediumRobotoPrimary)),
                              Padding(
                                  padding: EdgeInsets.only(left: 39.h),
                                  child: Text("lbl_f".tr,
                                      style: CustomTextStyles
                                          .titleMediumRobotoPrimary)),
                              Padding(
                                  padding: EdgeInsets.only(left: 38.h),
                                  child: Text("lbl_s".tr,
                                      style: CustomTextStyles
                                          .titleMediumRobotoPrimary))
                            ])),
                    SizedBox(height: 28.v),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                            padding: EdgeInsets.only(left: 53.h, right: 4.h),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text("lbl_1".tr,
                                      style: theme.textTheme.bodyLarge),
                                  Padding(
                                      padding: EdgeInsets.only(left: 41.h),
                                      child: Text("lbl_22".tr,
                                          style: theme.textTheme.bodyLarge)),
                                  Padding(
                                      padding: EdgeInsets.only(left: 39.h),
                                      child: Text("lbl_32".tr,
                                          style: theme.textTheme.bodyLarge)),
                                  Padding(
                                      padding: EdgeInsets.only(left: 39.h),
                                      child: Text("lbl_4".tr,
                                          style: theme.textTheme.bodyLarge)),
                                  Padding(
                                      padding: EdgeInsets.only(left: 39.h),
                                      child: Text("lbl_5".tr,
                                          style: theme.textTheme.bodyLarge)),
                                  Padding(
                                      padding: EdgeInsets.only(left: 39.h),
                                      child: Text("lbl_6".tr,
                                          style: theme.textTheme.bodyLarge))
                                ]))),
                    SizedBox(height: 28.v),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text("lbl_7".tr, style: theme.textTheme.bodyLarge),
                      Padding(
                          padding: EdgeInsets.only(left: 39.h),
                          child: Text("lbl_8".tr,
                              style: theme.textTheme.bodyLarge)),
                      Padding(
                          padding: EdgeInsets.only(left: 39.h),
                          child: Text("lbl_9".tr,
                              style: theme.textTheme.bodyLarge)),
                      Padding(
                          padding: EdgeInsets.only(left: 34.h),
                          child: Text("lbl_10".tr,
                              style: theme.textTheme.bodyLarge)),
                      Padding(
                          padding: EdgeInsets.only(left: 30.h),
                          child: Text("lbl_11".tr,
                              style: theme.textTheme.bodyLarge)),
                      Padding(
                          padding: EdgeInsets.only(left: 32.h),
                          child: Text("lbl_122".tr,
                              style: theme.textTheme.bodyLarge)),
                      Padding(
                          padding: EdgeInsets.only(left: 30.h),
                          child: Text("lbl_13".tr,
                              style: theme.textTheme.bodyLarge))
                    ]),
                    SizedBox(height: 28.v),
                    _buildTwentyOne(context,
                        twentyOneText: "lbl_14".tr,
                        twentyTwoText: "lbl_15".tr,
                        twentyThreeText: "lbl_16".tr,
                        twentyFourText: "lbl_17".tr,
                        twentyFiveText: "lbl_18".tr,
                        twentySixText: "lbl_19".tr,
                        twentySevenText: "lbl_20".tr),
                    SizedBox(height: 28.v),
                    _buildTwentyOne(context,
                        twentyOneText: "lbl_21".tr,
                        twentyTwoText: "lbl_222".tr,
                        twentyThreeText: "lbl_23".tr,
                        twentyFourText: "lbl_24".tr,
                        twentyFiveText: "lbl_25".tr,
                        twentySixText: "lbl_26".tr,
                        twentySevenText: "lbl_27".tr),
                    SizedBox(height: 28.v),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Row(children: [
                          Text("lbl_28".tr, style: theme.textTheme.bodyLarge),
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
            ])));
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
    required String twentyOneText,
    required String twentyTwoText,
    required String twentyThreeText,
    required String twentyFourText,
    required String twentyFiveText,
    required String twentySixText,
    required String twentySevenText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(twentyOneText,
          style:
              theme.textTheme.bodyLarge!.copyWith(color: appTheme.black90001)),
      Padding(
          padding: EdgeInsets.only(left: 32.h),
          child: Text(twentyTwoText,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: appTheme.black90001))),
      Padding(
          padding: EdgeInsets.only(left: 30.h),
          child: Text(twentyThreeText,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: appTheme.black90001))),
      Padding(
          padding: EdgeInsets.only(left: 30.h),
          child: Text(twentyFourText,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: appTheme.black90001))),
      Padding(
          padding: EdgeInsets.only(left: 30.h),
          child: Text(twentyFiveText,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: appTheme.black90001))),
      Padding(
          padding: EdgeInsets.only(left: 30.h),
          child: Text(twentySixText,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: appTheme.black90001))),
      Padding(
          padding: EdgeInsets.only(left: 30.h),
          child: Text(twentySevenText,
              style: theme.textTheme.bodyLarge!
                  .copyWith(color: appTheme.black90001)))
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
