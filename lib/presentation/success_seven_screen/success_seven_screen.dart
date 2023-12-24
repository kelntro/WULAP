import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class SuccessSevenScreen extends StatelessWidget {
  const SuccessSevenScreen({Key? key})
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
              Container(
                height: 48.v,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: appTheme.whiteA700,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(33.h),
                  ),
                ),
              ),
              Spacer(
                flex: 35,
              ),
              _buildUpdateSection(context),
              Spacer(
                flex: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUpdateSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 23.h),
      padding: EdgeInsets.symmetric(
        horizontal: 44.h,
        vertical: 34.v,
      ),
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 64.adaptSize,
            padding: EdgeInsets.symmetric(
              horizontal: 27.h,
              vertical: 7.v,
            ),
            decoration: AppDecoration.outlinePurpleA.copyWith(
              borderRadius: BorderRadiusStyle.circleBorder34,
            ),
            child: Text(
              "lbl5".tr,
              style: theme.textTheme.displaySmall,
            ),
          ),
          SizedBox(height: 55.v),
          Container(
            width: 240.h,
            margin: EdgeInsets.only(
              left: 6.h,
              right: 7.h,
            ),
            child: Text(
              "msg_your_account_has".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.titleSmallBluegray800.copyWith(
                height: 1.20,
              ),
            ),
          ),
          SizedBox(height: 59.v),
          CustomElevatedButton(
            height: 46.v,
            text: "lbl_go_to_dashboard".tr,
            buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
          ),
        ],
      ),
    );
  }
}
