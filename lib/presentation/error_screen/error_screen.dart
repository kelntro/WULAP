import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  Container(
                      height: 48.v,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: appTheme.whiteA700,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(33.h)))),
                  Spacer(flex: 44),
                  _buildErrorSection(context),
                  Spacer(flex: 55),
                  Container(
                      height: 30.v,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: appTheme.whiteA700,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(30.h))))
                ]))));
  }

  /// Section Widget
  Widget _buildErrorSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 23.h),
        padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 20.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 50.v),
              CustomImageView(
                  imagePath: ImageConstant.imgSad,
                  height: 51.adaptSize,
                  width: 51.adaptSize),
              SizedBox(height: 13.v),
              Text("msg_error_adding_item".tr,
                  style: CustomTextStyles.titleMediumPrimaryContainer),
              SizedBox(height: 14.v),
              SizedBox(
                  width: 287.h,
                  child: Text("msg_oops_something".tr,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodyMediumBluegray800_1
                          .copyWith(height: 1.20))),
              SizedBox(height: 12.v),
              CustomElevatedButton(
                  height: 45.v,
                  text: "lbl_try_again".tr,
                  margin: EdgeInsets.only(left: 17.h, right: 16.h),
                  buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                  onPressed: () {
                    onTapTryAgain(context);
                  })
            ]));
  }

  /// Navigates to the myPostsScreen when the action is triggered.
  onTapTryAgain(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myPostsScreen);
  }
}
