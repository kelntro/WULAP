import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class Userprofilelist1ItemWidget extends StatelessWidget {
  const Userprofilelist1ItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 21.h,
        vertical: 13.v,
      ),
      decoration: AppDecoration.fillGray40033.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgEllipse5914,
            height: 45.v,
            width: 44.h,
            radius: BorderRadius.circular(
              22.h,
            ),
            margin: EdgeInsets.only(
              left: 5.h,
              bottom: 1.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 11.h,
              top: 13.v,
              bottom: 4.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_chin_santos".tr,
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  "lbl_september".tr,
                  style: CustomTextStyles.dMSansGray800,
                ),
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgOverflowMenu,
            height: 24.v,
            width: 23.h,
            margin: EdgeInsets.symmetric(vertical: 11.v),
          ),
        ],
      ),
    );
  }
}
