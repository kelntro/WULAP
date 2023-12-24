import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class OnboardingTwelveScreen extends StatelessWidget {
  const OnboardingTwelveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 22.h, vertical: 32.v),
                child: Column(children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                          onTap: () {
                            onTapTxtSkip(context);
                          },
                          child: Text("lbl_skip".tr,
                              style: CustomTextStyles.titleMediumPrimary
                                  .copyWith(
                                      decoration: TextDecoration.underline)))),
                  Spacer(),
                  CustomImageView(
                      imagePath: ImageConstant.imgSavingsRafiki,
                      height: 176.v,
                      width: 236.h),
                  SizedBox(height: 81.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 19.h),
                          child: Text("msg_start_saving_for".tr,
                              style: CustomTextStyles
                                  .titleMediumBluegray800Bold))),
                  SizedBox(height: 8.v),
                  Container(
                      width: 330.h,
                      margin: EdgeInsets.symmetric(horizontal: 7.h),
                      child: Text("msg_use_cloud_cooperative".tr,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: CustomTextStyles.bodyMediumBluegray800_3
                              .copyWith(height: 1.20))),
                  SizedBox(height: 54.v),
                  SizedBox(
                      height: 10.v,
                      child: AnimatedSmoothIndicator(
                          activeIndex: 0,
                          count: 3,
                          effect: ScrollingDotsEffect(
                              spacing: 8,
                              activeDotColor: theme.colorScheme.primary,
                              dotColor: appTheme.purpleA700,
                              dotHeight: 10.v,
                              dotWidth: 10.h))),
                  SizedBox(height: 88.v),
                  CustomElevatedButton(
                      height: 52.v,
                      text: "lbl_get_started".tr,
                      margin: EdgeInsets.symmetric(horizontal: 29.h),
                      buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
                      onPressed: () {
                        onTapGetStarted(context);
                      }),
                  SizedBox(height: 86.v)
                ]))));
  }

  /// Navigates to the registerScreen when the action is triggered.
  onTapTxtSkip(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerScreen);
  }

  /// Navigates to the registerScreen when the action is triggered.
  onTapGetStarted(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerScreen);
  }
}
