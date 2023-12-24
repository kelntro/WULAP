import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class UsernotificationItemWidget extends StatelessWidget {
  const UsernotificationItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 149.v,
      width: 351.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(left: 2.h),
              padding: EdgeInsets.symmetric(
                horizontal: 3.h,
                vertical: 9.v,
              ),
              decoration: AppDecoration.fillBlueGray.copyWith(
                borderRadius: BorderRadiusStyle.circleBorder12,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 8.v),
                  Padding(
                    padding: EdgeInsets.only(left: 60.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 241.h,
                            child: Text(
                              "msg_hello_mitch_doe".tr,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              style:
                                  CustomTextStyles.bodySmallOutfitBlack90002_1,
                            ),
                          ),
                        ),
                        Container(
                          width: 19.adaptSize,
                          margin: EdgeInsets.only(
                            left: 22.h,
                            bottom: 73.v,
                          ),
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
                      ],
                    ),
                  ),
                  SizedBox(height: 12.v),
                  Padding(
                    padding: EdgeInsets.only(right: 30.h),
                    child: Text(
                      "lbl_1m_ago".tr,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 13.h,
                vertical: 10.v,
              ),
              decoration: AppDecoration.outlinePrimary.copyWith(
                borderRadius: BorderRadiusStyle.roundedBorder16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 90.v),
                  CustomImageView(
                    imagePath: ImageConstant.imgNotificationDeepOrange60037x33,
                    height: 37.v,
                    width: 33.h,
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
