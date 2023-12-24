import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_title.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_floating_button.dart';

// ignore_for_file: must_be_immutable
class DateOfRealizationAndDeadlineTrackingScreen extends StatelessWidget {
  DateOfRealizationAndDeadlineTrackingScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 44.v),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 34.h),
                      child: Column(children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                height: 81.v,
                                width: 298.h,
                                margin: EdgeInsets.only(left: 6.h),
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Opacity(
                                              opacity: 0.5,
                                              child: Container(
                                                  width: 257.h,
                                                  margin: EdgeInsets.only(
                                                      left: 11.h),
                                                  child: Text(
                                                      "msg_event_type_realization"
                                                          .tr,
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: CustomTextStyles
                                                          .bodyMediumBlack90002
                                                          .copyWith(
                                                              height: 1.39))))),
                                      Opacity(
                                          opacity: 0.5,
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  height: 81.v,
                                                  width: 298.h,
                                                  decoration: BoxDecoration(
                                                      color: theme
                                                          .colorScheme.onError,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.h)))))
                                    ]))),
                        SizedBox(height: 12.v),
                        _buildEditEventRow1(context),
                        SizedBox(height: 19.v),
                        SizedBox(
                            height: 81.v,
                            width: 298.h,
                            child:
                                Stack(alignment: Alignment.center, children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Opacity(
                                      opacity: 0.5,
                                      child: Container(
                                          width: 233.h,
                                          margin: EdgeInsets.only(left: 11.h),
                                          child: Text(
                                              "msg_event_type_payment".tr,
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: CustomTextStyles
                                                  .bodyMediumBlack90002
                                                  .copyWith(height: 1.39))))),
                              Opacity(
                                  opacity: 0.5,
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          height: 81.v,
                                          width: 298.h,
                                          decoration: BoxDecoration(
                                              color: theme.colorScheme.onError,
                                              borderRadius:
                                                  BorderRadius.circular(6.h)))))
                            ])),
                        SizedBox(height: 13.v),
                        _buildEditEventRow2(context),
                        SizedBox(height: 19.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                height: 81.v,
                                width: 298.h,
                                margin: EdgeInsets.only(left: 6.h),
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Opacity(
                                              opacity: 0.5,
                                              child: Container(
                                                  width: 257.h,
                                                  margin: EdgeInsets.only(
                                                      left: 11.h),
                                                  child: Text(
                                                      "msg_event_type_realization"
                                                          .tr,
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: CustomTextStyles
                                                          .bodyMediumBlack90002
                                                          .copyWith(
                                                              height: 1.39))))),
                                      Opacity(
                                          opacity: 0.5,
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  height: 81.v,
                                                  width: 298.h,
                                                  decoration: BoxDecoration(
                                                      color: theme
                                                          .colorScheme.onError,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.h)))))
                                    ]))),
                        SizedBox(height: 13.v),
                        _buildEditEventRow3(context),
                        SizedBox(height: 19.v),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                                height: 81.v,
                                width: 298.h,
                                margin: EdgeInsets.only(left: 6.h),
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Opacity(
                                              opacity: 0.5,
                                              child: Container(
                                                  width: 257.h,
                                                  margin: EdgeInsets.only(
                                                      left: 11.h),
                                                  child: Text(
                                                      "msg_event_type_realization"
                                                          .tr,
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: CustomTextStyles
                                                          .bodyMediumBlack90002
                                                          .copyWith(
                                                              height: 1.39))))),
                                      Opacity(
                                          opacity: 0.5,
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  height: 81.v,
                                                  width: 298.h,
                                                  decoration: BoxDecoration(
                                                      color: theme
                                                          .colorScheme.onError,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6.h)))))
                                    ]))),
                        SizedBox(height: 12.v),
                        _buildEditEventRow4(context)
                      ]))
                ])),
            bottomNavigationBar: _buildBottomBar(context),
            floatingActionButton: _buildFloatingActionButton(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 42.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlueGray80024x24,
            margin: EdgeInsets.only(left: 18.h, top: 16.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_date_tracking".tr));
  }

  /// Section Widget
  Widget _buildEditEventButton1(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            text: "lbl_edit_event".tr,
            margin: EdgeInsets.only(top: 1.v),
            onPressed: () {
              onTapEditEventButton1(context);
            }));
  }

  /// Section Widget
  Widget _buildEditEventRow1(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildEditEventButton1(context),
          CustomImageView(
              imagePath: ImageConstant.imgMoreOverflowMenuVertPrimary,
              height: 37.v,
              width: 34.h)
        ]));
  }

  /// Section Widget
  Widget _buildEditEventButton2(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            text: "lbl_edit_event".tr,
            onPressed: () {
              onTapEditEventButton2(context);
            }));
  }

  /// Section Widget
  Widget _buildEditEventRow2(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildEditEventButton2(context),
          CustomImageView(
              imagePath: ImageConstant.imgMoreOverflowMenuVertPrimary,
              height: 37.v,
              width: 34.h,
              margin: EdgeInsets.only(left: 4.h))
        ]));
  }

  /// Section Widget
  Widget _buildEditEventButton3(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            text: "lbl_edit_event".tr,
            onPressed: () {
              onTapEditEventButton3(context);
            }));
  }

  /// Section Widget
  Widget _buildEditEventRow3(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildEditEventButton3(context),
          CustomImageView(
              imagePath: ImageConstant.imgMoreOverflowMenuVertPrimary,
              height: 37.v,
              width: 34.h,
              margin: EdgeInsets.only(left: 5.h))
        ]));
  }

  /// Section Widget
  Widget _buildEditEventButton4(BuildContext context) {
    return Expanded(
        child: CustomElevatedButton(
            text: "lbl_edit_event".tr,
            margin: EdgeInsets.only(top: 1.v),
            onPressed: () {
              onTapEditEventButton4(context);
            }));
  }

  /// Section Widget
  Widget _buildEditEventRow4(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _buildEditEventButton4(context),
          CustomImageView(
              imagePath: ImageConstant.imgMoreOverflowMenuVertPrimary,
              height: 37.v,
              width: 34.h,
              margin: EdgeInsets.only(left: 3.h))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return CustomFloatingButton(
        height: 45,
        width: 45,
        backgroundColor: theme.colorScheme.primary,
        child: CustomImageView(
            imagePath: ImageConstant.imgAdd, height: 22.5.v, width: 22.5.h));
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

  /// Navigates to the editEventOneScreen when the action is triggered.
  onTapEditEventButton1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editEventOneScreen);
  }

  /// Navigates to the editEventOneScreen when the action is triggered.
  onTapEditEventButton2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editEventOneScreen);
  }

  /// Navigates to the editEventOneScreen when the action is triggered.
  onTapEditEventButton3(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editEventOneScreen);
  }

  /// Navigates to the editEventOneScreen when the action is triggered.
  onTapEditEventButton4(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.editEventOneScreen);
  }
}
