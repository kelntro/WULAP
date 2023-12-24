import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class FoodgridItemWidget extends StatelessWidget {
  FoodgridItemWidget({
    Key? key,
    this.onTapFoodGrid,
  }) : super(
          key: key,
        );

  VoidCallback? onTapFoodGrid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapFoodGrid!.call();
      },
      child: Container(
        decoration: AppDecoration.fillWhiteA.copyWith(
          borderRadius: BorderRadiusStyle.circleBorder12,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 220.v,
              width: 160.h,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgBg220x160,
                    height: 220.v,
                    width: 160.h,
                    radius: BorderRadius.circular(
                      10.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 14.h,
                        right: 14.h,
                        bottom: 14.v,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgSearchWhiteA700,
                                height: 16.adaptSize,
                                width: 16.adaptSize,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text(
                                  "lbl_25min2".tr,
                                  style: CustomTextStyles
                                      .bodySmallABeeZeeWhiteA700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.v),
                          Row(
                            children: [
                              CustomImageView(
                                imagePath: ImageConstant.imgProfile,
                                height: 16.adaptSize,
                                width: 16.adaptSize,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 4.h,
                                  top: 2.v,
                                  bottom: 2.v,
                                ),
                                child: Text(
                                  "lbl_free".tr,
                                  style: CustomTextStyles
                                      .bodySmallABeeZeeWhiteA700,
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 36.h,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 9.h,
                                  vertical: 2.v,
                                ),
                                decoration: AppDecoration.fillPrimary.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder6,
                                ),
                                child: Text(
                                  "lbl_4_5".tr,
                                  style: CustomTextStyles
                                      .bodySmallABeeZeeWhiteA700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.v),
            Text(
              "lbl_mcdonald_s".tr,
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: 5.v),
            Row(
              children: [
                Text(
                  "lbl_chinese".tr,
                  style: CustomTextStyles.bodyLargeABeeZeeBluegray40002,
                ),
                Opacity(
                  opacity: 0.5,
                  child: Container(
                    height: 4.adaptSize,
                    width: 4.adaptSize,
                    margin: EdgeInsets.only(
                      left: 12.h,
                      top: 10.v,
                      bottom: 4.v,
                    ),
                    decoration: BoxDecoration(
                      color: appTheme.blueGray40002.withOpacity(0.53),
                      borderRadius: BorderRadius.circular(
                        2.h,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.h),
                  child: Text(
                    "lbl_american".tr,
                    style: CustomTextStyles.bodyLargeABeeZeeBluegray40002,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.v),
          ],
        ),
      ),
    );
  }
}
