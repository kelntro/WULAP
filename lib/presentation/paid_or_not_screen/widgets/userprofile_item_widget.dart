import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class UserprofileItemWidget extends StatelessWidget {
  const UserprofileItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.v,
      width: 336.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgClose,
            height: 20.adaptSize,
            width: 20.adaptSize,
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(right: 25.h),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 27.h,
                vertical: 13.v,
              ),
              decoration: AppDecoration.fillGray40033.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder30,
              ),
              child: Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgEllipse47,
                    height: 45.adaptSize,
                    width: 45.adaptSize,
                    radius: BorderRadius.circular(
                      22.h,
                    ),
                    margin: EdgeInsets.only(bottom: 1.v),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 13.h,
                      top: 12.v,
                      bottom: 12.v,
                    ),
                    child: Text(
                      "lbl_mitch_doe".tr,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
