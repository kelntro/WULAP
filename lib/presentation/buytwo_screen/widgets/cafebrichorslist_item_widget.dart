import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class CafebrichorslistItemWidget extends StatelessWidget {
  const CafebrichorslistItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.fillWhiteA.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgFood2,
            height: 110.adaptSize,
            width: 110.adaptSize,
            radius: BorderRadius.circular(
              8.h,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "lbl_cafe_brichor_s2".tr,
                style: CustomTextStyles.bodyLargeABeeZeeBlack90018,
              ),
              SizedBox(height: 9.v),
              Row(
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
                        style:
                            CustomTextStyles.bodyLargeABeeZeeBlack900.copyWith(
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
                      "lbl_p399".tr,
                      style: CustomTextStyles.bodyMediumABeeZeePrimary_1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
