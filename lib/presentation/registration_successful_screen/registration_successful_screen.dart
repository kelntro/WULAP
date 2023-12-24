import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class RegistrationSuccessfulScreen extends StatelessWidget {
  const RegistrationSuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 23.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 5.v),
                      _buildRegistrationSuccessful(context)
                    ]))));
  }

  /// Section Widget
  Widget _buildRegistrationSuccessful(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 43.h, vertical: 56.v),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(height: 14.v),
          CustomImageView(
              imagePath: ImageConstant.imgCheckRing, height: 51.v, width: 53.h),
          SizedBox(height: 13.v),
          Text("msg_account_created".tr,
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

  /// Navigates to the logInScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.logInScreen);
  }
}
