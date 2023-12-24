import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class FooditemsItemWidget extends StatelessWidget {
  const FooditemsItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 24.adaptSize,
          padding: EdgeInsets.symmetric(
            horizontal: 6.h,
            vertical: 1.v,
          ),
          decoration: AppDecoration.outlineBlueGray.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder6,
          ),
          child: Text(
            "lbl_1".tr,
            style: CustomTextStyles.bodyLargeABeeZeePrimary,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h),
          child: Text(
            "lbl_cookie_sandwich".tr,
            style: CustomTextStyles.bodyLargeABeeZeeBlack90018,
          ),
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 3.v),
          child: Text(
            "lbl_p500".tr,
            style: CustomTextStyles.bodyMediumABeeZeePrimary_1,
          ),
        ),
      ],
    );
  }
}
