import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class SuccessTwoScreen extends StatelessWidget {
  const SuccessTwoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildArrowLeft(context),
                  Spacer(flex: 41),
                  _buildSuccessful(context),
                  Spacer(flex: 58)
                ]))));
  }

  /// Section Widget
  Widget _buildArrowLeft(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 12.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL33),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 12.v),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeftBlack9000212x15,
                  height: 12.v,
                  width: 15.h,
                  onTap: () {
                    onTapImgArrowLeft(context);
                  })
            ]));
  }

  /// Section Widget
  Widget _buildSuccessful(BuildContext context) {
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
              Text("msg_saved_successfully".tr,
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

  /// Navigates to the dashboardPaluwaganScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.dashboardPaluwaganScreen);
  }
}
