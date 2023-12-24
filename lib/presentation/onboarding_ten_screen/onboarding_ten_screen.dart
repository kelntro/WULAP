import '../onboarding_ten_screen/widgets/onboardingslider_item_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_icon_button.dart';

// ignore_for_file: must_be_immutable
class OnboardingTenScreen extends StatelessWidget {
  OnboardingTenScreen({Key? key}) : super(key: key);

  int sliderIndex = 1;

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
                      imagePath: ImageConstant.imgIllustr,
                      height: 176.v,
                      width: 205.h),
                  SizedBox(height: 80.v),
                  _buildOnboardingSlider(context),
                  SizedBox(height: 34.v),
                  SizedBox(
                      height: 10.v,
                      child: AnimatedSmoothIndicator(
                          activeIndex: sliderIndex,
                          count: 1,
                          axisDirection: Axis.horizontal,
                          effect: ScrollingDotsEffect(
                              spacing: 8,
                              activeDotColor: theme.colorScheme.primary,
                              dotColor: appTheme.purpleA700,
                              dotHeight: 10.v,
                              dotWidth: 10.h))),
                  SizedBox(height: 88.v),
                  CustomIconButton(
                      height: 52.v,
                      width: 164.h,
                      padding: EdgeInsets.all(9.h),
                      decoration: IconButtonStyleHelper.fillPrimary,
                      onTap: () {
                        onTapBtnArrowRight(context);
                      },
                      child: CustomImageView(
                          imagePath: ImageConstant.imgArrowRightWhiteA700)),
                  SizedBox(height: 86.v)
                ]))));
  }

  /// Section Widget
  Widget _buildOnboardingSlider(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 13.h, right: 9.h),
        child: CarouselSlider.builder(
            options: CarouselOptions(
                height: 90.v,
                initialPage: 0,
                autoPlay: true,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index, reason) {
                  sliderIndex = index;
                }),
            itemCount: 1,
            itemBuilder: (context, index, realIndex) {
              return OnboardingsliderItemWidget();
            }));
  }

  /// Navigates to the registerScreen when the action is triggered.
  onTapTxtSkip(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerScreen);
  }

  /// Navigates to the onboardingElevenScreen when the action is triggered.
  onTapBtnArrowRight(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.onboardingElevenScreen);
  }
}
