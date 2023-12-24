import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_title.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class EnableAutomaticRemindersOneScreen extends StatelessWidget {
  EnableAutomaticRemindersOneScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 6.h, vertical: 47.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15.v),
                      Padding(
                          padding: EdgeInsets.only(left: 19.h),
                          child: Text("msg_payment_reminders".tr,
                              style: CustomTextStyles
                                  .bodyLargeDMSansBlack9000217)),
                      SizedBox(height: 19.v),
                      _buildLineOneStack(context),
                      SizedBox(height: 16.v),
                      Opacity(
                          opacity: 0.5,
                          child: Container(
                              width: 311.h,
                              margin: EdgeInsets.only(left: 18.h, right: 48.h),
                              child: Text("msg_when_enabled_the".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles.bodyMediumBlack90002_1
                                      .copyWith(height: 1.57)))),
                      Spacer(),
                      CustomElevatedButton(
                          width: 153.h,
                          text: "lbl_next".tr,
                          margin: EdgeInsets.only(right: 38.h),
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
        title: AppbarTitle(text: "msg_enable_automatic".tr));
  }

  /// Section Widget
  Widget _buildLineOneStack(BuildContext context) {
    return SizedBox(
        height: 50.v,
        width: 375.h,
        child: Stack(alignment: Alignment.bottomLeft, children: [
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  width: 375.h, child: Divider(color: appTheme.gray3004c))),
          Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                  width: 288.h,
                  margin: EdgeInsets.only(left: 18.h),
                  child: Text("msg_toggle_switch_to".tr,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.bodyMedium_1
                          .copyWith(height: 1.57)))),
          CustomImageView(
              imagePath: ImageConstant.imgOffer,
              height: 28.v,
              width: 48.h,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(right: 12.h),
              onTap: () {
                onTapImgOffer(context);
              })
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

  /// Navigates to the enableAutomaticRemindersScreen when the action is triggered.
  onTapImgOffer(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.enableAutomaticRemindersScreen);
  }

  /// Navigates to the additionalOptionsOneScreen when the action is triggered.
  onTapNext(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.additionalOptionsOneScreen);
  }
}
