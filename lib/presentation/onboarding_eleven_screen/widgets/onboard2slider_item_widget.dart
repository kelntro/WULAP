import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class Onboard2sliderItemWidget extends StatelessWidget {
  const Onboard2sliderItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 254.h,
          margin: EdgeInsets.only(
            left: 27.h,
            right: 32.h,
          ),
          child: Text(
            "msg_unlocking_financial".tr,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: CustomTextStyles.titleMediumBluegray800Bold.copyWith(
              height: 1.20,
            ),
          ),
        ),
        SizedBox(height: 6.v),
        SizedBox(
          width: 314.h,
          child: Text(
            "msg_we_inject_saving".tr,
            maxLines: 3,
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
