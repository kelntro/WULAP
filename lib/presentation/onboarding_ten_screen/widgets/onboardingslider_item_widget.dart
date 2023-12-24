import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class OnboardingsliderItemWidget extends StatelessWidget {
  const OnboardingsliderItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 294.h,
          margin: EdgeInsets.only(
            left: 4.h,
            right: 24.h,
          ),
          child: Text(
            "msg_revolutionizing".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.titleMediumBluegray800Bold.copyWith(
              height: 1.20,
            ),
          ),
        ),
        SizedBox(height: 7.v),
        SizedBox(
          width: 322.h,
          child: Text(
            "msg_we_are_committed".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.bodyMediumBluegray800_3.copyWith(
              height: 1.20,
            ),
          ),
        ),
      ],
    );
  }
}
