import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class OrdernotificationItemWidget extends StatelessWidget {
  const OrdernotificationItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 5.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.fillGray40033.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgUnsplashYdoehmfa4mu,
            height: 65.adaptSize,
            width: 65.adaptSize,
            radius: BorderRadius.circular(
              32.h,
            ),
            margin: EdgeInsets.only(bottom: 35.v),
          ),
          Expanded(
            child: Opacity(
              opacity: 0.5,
              child: Container(
                width: 254.h,
                margin: EdgeInsets.only(
                  left: 5.h,
                  bottom: 21.v,
                ),
                child: Text(
                  "msg_you_have_a_new_order".tr,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.bodyMediumBlack90002.copyWith(
                    height: 1.39,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 19.adaptSize,
                  margin: EdgeInsets.only(left: 2.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 6.h,
                    vertical: 2.v,
                  ),
                  decoration: AppDecoration.fillPurpleA7001.copyWith(
                    borderRadius: BorderRadiusStyle.roundedBorder9,
                  ),
                  child: Text(
                    "lbl_22".tr,
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                SizedBox(height: 56.v),
                CustomImageView(
                  imagePath: ImageConstant.imgMoreOverflowMenuVert,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
