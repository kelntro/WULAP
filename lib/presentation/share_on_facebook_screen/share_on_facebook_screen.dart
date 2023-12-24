import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ShareOnFacebookScreen extends StatelessWidget {
  ShareOnFacebookScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: SizedBox(
                        height: 821.v,
                        width: double.maxFinite,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12.h, vertical: 36.v),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgRectangle249,
                                            height: 487.v,
                                            width: 366.h,
                                            radius:
                                                BorderRadius.circular(20.h)),
                                        SizedBox(height: 35.v),
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                                padding:
                                                    EdgeInsets.only(left: 2.h),
                                                child: Text("lbl_caption".tr,
                                                    style: CustomTextStyles
                                                        .titleMediumBlack90002))),
                                        SizedBox(height: 2.v),
                                        _buildSeventyFour(context),
                                        SizedBox(height: 35.v),
                                        CustomElevatedButton(
                                            text: "msg_share_on_facebook".tr,
                                            buttonTextStyle: CustomTextStyles
                                                .titleMediumWhiteA700,
                                            onPressed: () {
                                              onTapShareOnFacebook(context);
                                            }),
                                        SizedBox(height: 14.v)
                                      ]))),
                          _buildArrowLeft(context)
                        ])))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildSeventyFour(BuildContext context) {
    return Container(
        width: 366.h,
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 6.v),
        decoration: AppDecoration.fillGray10003
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 10.v),
              Container(
                  width: 252.h,
                  margin: EdgeInsets.only(right: 77.h),
                  child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "msg_open_for_the_7th2".tr,
                            style: CustomTextStyles.titleSmall_1
                                .copyWith(height: 1.50)),
                        TextSpan(
                            text: "lbl_monthly".tr,
                            style: CustomTextStyles.titleSmallMedium),
                        TextSpan(
                            text: "lbl_12".tr,
                            style: CustomTextStyles.titleSmall_1),
                        TextSpan(
                            text: "msg_months_to_pay".tr,
                            style: CustomTextStyles.titleSmallMedium)
                      ]),
                      textAlign: TextAlign.left))
            ]));
  }

  /// Section Widget
  Widget _buildArrowLeft(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 15.v),
            decoration:
                BoxDecoration(borderRadius: BorderRadiusStyle.customBorderTL33),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 21.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgArrowLeftBlack9000212x15,
                      height: 12.v,
                      width: 15.h,
                      onTap: () {
                        onTapImgArrowLeft(context);
                      })
                ])));
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

  /// Navigates to the successFiveScreen when the action is triggered.
  onTapShareOnFacebook(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.successFiveScreen);
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
