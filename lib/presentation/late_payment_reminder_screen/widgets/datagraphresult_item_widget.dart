import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';

// ignore: must_be_immutable
class DatagraphresultItemWidget extends StatelessWidget {
  const DatagraphresultItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 16.adaptSize,
              width: 16.adaptSize,
              margin: EdgeInsets.only(top: 2.v),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(
                  8.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.h),
              child: Text(
                "lbl_member_1".tr,
                style: CustomTextStyles.titleMediumInterBlack90002_1,
              ),
            ),
            Spacer(),
            Text(
              "lbl_statistic".tr,
              style: CustomTextStyles.bodyMediumInter_1,
            ),
          ],
        ),
        SizedBox(height: 15.v),
        Divider(
          color: appTheme.gray20001,
        ),
      ],
    );
  }
}
