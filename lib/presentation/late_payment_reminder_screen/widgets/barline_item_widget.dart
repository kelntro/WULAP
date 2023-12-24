import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class BarlineItemWidget extends StatelessWidget {
  const BarlineItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              height: 165.v,
              width: 16.h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgBackground,
                    height: 159.v,
                    width: 16.h,
                    radius: BorderRadius.circular(
                      8.h,
                    ),
                    alignment: Alignment.topCenter,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 117.v,
                      width: 16.h,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(
                          8.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(
            "lbl_item".tr,
            style: CustomTextStyles.bodySmallInterGray700,
          ),
        ],
      ),
    );
  }
}
