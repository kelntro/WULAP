import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class CookiesandwichlistItemWidget extends StatelessWidget {
  const CookiesandwichlistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116.v,
      width: 347.h,
      padding: EdgeInsets.all(2.h),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(right: 9.h),
              decoration: AppDecoration.fillWhiteA.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder6,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 1.v),
                  Padding(
                    padding: EdgeInsets.only(right: 110.h),
                    child: Text(
                      "lbl_mcdonald_s".tr,
                      style: CustomTextStyles.bodyLargeABeeZeeBlack90018,
                    ),
                  ),
                  SizedBox(height: 8.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.64,
                        child: Container(
                          width: 162.h,
                          margin: EdgeInsets.only(bottom: 5.v),
                          child: Text(
                            "msg_shortbread_chocolate".tr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: CustomTextStyles.bodyLargeABeeZeeBlack900
                                .copyWith(
                              height: 1.50,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 7.h,
                          top: 60.v,
                        ),
                        child: Text(
                          "lbl_p499".tr,
                          style: CustomTextStyles.bodyMediumABeeZeePrimary_1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgFood,
            height: 111.v,
            width: 110.h,
            radius: BorderRadius.circular(
              8.h,
            ),
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }
}
