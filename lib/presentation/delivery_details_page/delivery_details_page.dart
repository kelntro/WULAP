import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class DeliveryDetailsPage extends StatefulWidget {
  const DeliveryDetailsPage({Key? key}) : super(key: key);

  @override
  DeliveryDetailsPageState createState() => DeliveryDetailsPageState();
}

class DeliveryDetailsPageState extends State<DeliveryDetailsPage>
    with AutomaticKeepAliveClientMixin<DeliveryDetailsPage> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                decoration: AppDecoration.fillWhiteA,
                child: Column(children: [
                  SizedBox(height: 26.v),
                  _buildTrackDelivery(context)
                ]))));
  }

  /// Section Widget
  Widget _buildTrackDelivery(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Text("msg_receiver_details".tr,
                  style: CustomTextStyles.titleMediumBlack90002)),
          SizedBox(height: 12.v),
          _buildFrameFiftySeven(context,
              deliveryTime: "lbl_deliver_date".tr, time: "lbl_oct_20_2023".tr),
          SizedBox(height: 9.v),
          _buildFrameFiftySeven(context,
              deliveryTime: "lbl_delivery_time".tr, time: "lbl_10_00_am".tr),
          SizedBox(height: 14.v),
          _buildFrameFiftySeven(context,
              deliveryTime: "lbl_location_from".tr,
              time: "msg_buhangin_davao".tr),
          SizedBox(height: 7.v),
          _buildFrameFiftySeven(context,
              deliveryTime: "lbl_location_to".tr,
              time: "msg_25_generoso_davao".tr),
          SizedBox(height: 18.v),
          Divider(),
          SizedBox(height: 14.v),
          _buildFrameFiftySeven(context,
              deliveryTime: "lbl_receiver".tr, time: "lbl_tony_herz".tr),
          SizedBox(height: 62.v),
          CustomElevatedButton(
              height: 67.v,
              text: "lbl_track_delivery".tr,
              buttonStyle: CustomButtonStyles.fillDeepPurpleA,
              buttonTextStyle: CustomTextStyles.titleMediumNunitoWhiteA700,
              onPressed: () {
                onTapTrackDelivery(context);
              })
        ]));
  }

  /// Common widget
  Widget _buildFrameFiftySeven(
    BuildContext context, {
    required String deliveryTime,
    required String time,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(deliveryTime,
          style: CustomTextStyles.titleMediumNunitoGray50001
              .copyWith(color: appTheme.gray50001)),
      Text(time,
          style: CustomTextStyles.titleMediumDeeppurpleA700
              .copyWith(color: appTheme.deepPurpleA700))
    ]);
  }

  /// Navigates to the trackDeliveryScreen when the action is triggered.
  onTapTrackDelivery(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.trackDeliveryScreen);
  }
}
