import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class MenuitemslistItemWidget extends StatelessWidget {
  const MenuitemslistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.v),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 337.h,
            margin: EdgeInsets.only(right: 2.h),
            padding: EdgeInsets.symmetric(
              horizontal: 15.h,
              vertical: 7.v,
            ),
            decoration: AppDecoration.fillBlueGray.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder6,
            ),
            child: Container(
              width: 266.h,
              margin: EdgeInsets.only(right: 40.h),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "lbl_menu_item".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    TextSpan(
                      text: "lbl_hamburger".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: "lbl_category".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    TextSpan(
                      text: "lbl_fast_food2".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: "lbl_date_posted".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    TextSpan(
                      text: "msg_september_10".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: "lbl_link".tr,
                      style: theme.textTheme.titleSmall,
                    ),
                    TextSpan(
                      text: "lbl4".tr,
                      style: theme.textTheme.bodyMedium,
                    ),
                    TextSpan(
                      text: "msg_https_www_fac".tr,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(height: 11.v),
          SizedBox(
            height: 37.v,
            width: 337.h,
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgMoreOverflowMenuVertPrimary,
                  height: 37.v,
                  width: 34.h,
                  alignment: Alignment.centerRight,
                ),
                CustomElevatedButton(
                  width: 304.h,
                  text: "lbl_visit_link".tr,
                  alignment: Alignment.centerLeft,
                ),
              ],
            ),
          ),
          SizedBox(height: 2.v),
        ],
      ),
    );
  }
}
