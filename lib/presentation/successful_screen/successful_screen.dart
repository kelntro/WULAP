import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 12.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeftBlack9000212x15,
                          height: 12.v,
                          width: 15.h,
                          margin: EdgeInsets.only(left: 5.h),
                          onTap: () {
                            onTapImgArrowLeft(context);
                          }),
                      Spacer(flex: 24),
                      _buildResetPasswordSuccessfully(context),
                      Spacer(flex: 75)
                    ]))));
  }

  /// Section Widget
  Widget _buildResetPasswordSuccessfully(BuildContext context) {
    return Container(
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
              Text("msg_reset_password_successfully".tr,
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

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the logInScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.logInScreen);
  }
}
