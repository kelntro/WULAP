import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_icon_button.dart';

class OderDeliveryManagemaentThreeScreen extends StatelessWidget {
  const OderDeliveryManagemaentThreeScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildModeLightTypeDefault(context),
              Spacer(
                flex: 33,
              ),
              Container(
                height: 160.adaptSize,
                width: 160.adaptSize,
                padding: EdgeInsets.all(28.h),
                decoration: AppDecoration.fillGray20005.copyWith(
                  borderRadius: BorderRadiusStyle.circleBorder80,
                ),
                child: CustomImageView(
                  imagePath: ImageConstant.imgConfetti,
                  height: 104.adaptSize,
                  width: 104.adaptSize,
                  radius: BorderRadius.circular(
                    52.h,
                  ),
                  alignment: Alignment.center,
                ),
              ),
              SizedBox(height: 25.v),
              Text(
                "msg_order_successfully".tr,
                style: CustomTextStyles.headlineSmallGray90001,
              ),
              SizedBox(height: 8.v),
              Container(
                width: 313.h,
                margin: EdgeInsets.symmetric(horizontal: 38.h),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "lbl_the_order".tr,
                        style: CustomTextStyles.bodyLargeNunitoGray50001_1,
                      ),
                      TextSpan(
                        text: "msg_seta_33_has_been".tr,
                        style: CustomTextStyles.titleMediumNunitoGray90001,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(
                flex: 66,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildModeLightTypeDefault(BuildContext context) {
    return SizedBox(
      height: 73.v,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 63.v,
              width: double.maxFinite,
              decoration: BoxDecoration(
                color: appTheme.whiteA700,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(33.h),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 32.h),
            child: CustomIconButton(
              height: 44.adaptSize,
              width: 44.adaptSize,
              padding: EdgeInsets.all(10.h),
              decoration: IconButtonStyleHelper.fillPurpleA,
              alignment: Alignment.bottomLeft,
              child: CustomImageView(
                imagePath: ImageConstant.imgClose24Outline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
