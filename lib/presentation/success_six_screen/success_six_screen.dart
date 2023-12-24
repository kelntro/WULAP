import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class SuccessSixScreen extends StatelessWidget {
  const SuccessSixScreen({Key? key}) : super(key: key);

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
                  Spacer(flex: 27),
                  _buildSuccessfulSection(context),
                  Spacer(flex: 72)
                ]))));
  }

  /// Section Widget
  Widget _buildSuccessfulSection(BuildContext context) {
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
                  imagePath: ImageConstant.imgCheckRing,
                  height: 51.v,
                  width: 53.h),
              SizedBox(height: 13.v),
              Text("msg_added_successfully".tr,
                  style: CustomTextStyles.titleMediumGreen600),
              SizedBox(height: 19.v),
              SizedBox(
                  width: 288.h,
                  child: Text("msg_the_menu_item_has2".tr,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: CustomTextStyles.bodyMediumBluegray800_1
                          .copyWith(height: 1.20))),
              SizedBox(height: 41.v),
              CustomElevatedButton(
                  height: 45.v,
                  text: "lbl_continue".tr,
                  margin: EdgeInsets.symmetric(horizontal: 17.h),
                  buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                  onPressed: () {
                    onTapContinue(context);
                  })
            ]));
  }

  /// Navigates to the initialReminderScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.initialReminderScreen);
  }
}
