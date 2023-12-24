import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class CartappcardlistItemWidget extends StatelessWidget {
  CartappcardlistItemWidget({
    Key? key,
    this.onTapImgOverflowMenu,
  }) : super(
          key: key,
        );

  VoidCallback? onTapImgOverflowMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10.h,
        vertical: 22.v,
      ),
      decoration: AppDecoration.fillPurpleA700.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Row(
        children: [
          Container(
            height: 68.v,
            width: 77.h,
            padding: EdgeInsets.symmetric(
              horizontal: 13.h,
              vertical: 6.v,
            ),
            decoration: AppDecoration.outlineGrayC.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder20,
            ),
            child: CustomImageView(
              imagePath: ImageConstant.imgEllipse58,
              height: 50.v,
              width: 49.h,
              radius: BorderRadius.circular(
                25.h,
              ),
              alignment: Alignment.topCenter,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10.h,
              bottom: 27.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_chicken_buffalo".tr,
                  style: theme.textTheme.titleMedium,
                ),
                SizedBox(height: 1.v),
                Text(
                  "lbl_fresh_chicken".tr,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgOverflowMenu,
            height: 24.adaptSize,
            width: 24.adaptSize,
            margin: EdgeInsets.only(
              top: 22.v,
              right: 9.h,
              bottom: 22.v,
            ),
            onTap: () {
              onTapImgOverflowMenu!.call();
            },
          ),
        ],
      ),
    );
  }
}
