import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class SuccessFiveScreen extends StatelessWidget {
  const SuccessFiveScreen({Key? key}) : super(key: key);

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
                  _buildSuccessfulSection(context),
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
  Widget _buildSuccessfulSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 23.h),
        padding: EdgeInsets.symmetric(horizontal: 43.h, vertical: 56.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 14.v),
              CustomImageView(
                  imagePath: ImageConstant.imgCheckRing,
                  height: 51.v,
                  width: 53.h),
              SizedBox(height: 13.v),
              Text("msg_posted_on_facebook".tr,
                  style: CustomTextStyles.titleMediumGreen600),
              SizedBox(height: 76.v),
              CustomElevatedButton(
                  height: 45.v,
                  text: "lbl_continue".tr,
                  buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                  onPressed: () {
                    onTapContinue(context);
                  })
            ]));
  }

  /// Navigates to the setCScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.setCScreen);
  }
}
