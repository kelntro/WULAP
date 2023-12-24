import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class OderDeliveryManagemaentFourScreen extends StatelessWidget {
  OderDeliveryManagemaentFourScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildArrowLeftSection(context),
                  SizedBox(height: 10.v),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.h, vertical: 44.v),
                      decoration: AppDecoration.fillWhiteA,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("msg_set_a_total_payment".tr,
                                style: CustomTextStyles.titleMediumBlack90002),
                            SizedBox(height: 23.v),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.h),
                                child: _buildFrameFiftySeven(context,
                                    deliveryFee: "lbl_subtotal".tr,
                                    price: "lbl_8_000".tr)),
                            SizedBox(height: 8.v),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.h),
                                child: _buildFrameFiftySeven(context,
                                    deliveryFee: "lbl_delivery_fee".tr,
                                    price: "lbl_100".tr)),
                            SizedBox(height: 11.v),
                            Divider(indent: 4.h, endIndent: 4.h),
                            SizedBox(height: 14.v),
                            Padding(
                                padding: EdgeInsets.only(left: 3.h, right: 4.h),
                                child: _buildFrameFiftySeven(context,
                                    deliveryFee: "lbl_total".tr,
                                    price: "lbl_8_100".tr)),
                            SizedBox(height: 24.v),
                            _buildFrameElevenSection(context),
                            SizedBox(height: 26.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text("msg_receiver_details".tr,
                                    style: CustomTextStyles
                                        .titleMediumBlack90002)),
                            SizedBox(height: 12.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text("lbl_deliver_date".tr,
                                    style: CustomTextStyles
                                        .titleMediumNunitoGray50001)),
                            SizedBox(height: 9.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text("lbl_delivery_time".tr,
                                    style: CustomTextStyles
                                        .titleMediumNunitoGray50001)),
                            SizedBox(height: 14.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text("lbl_location_from".tr,
                                    style: CustomTextStyles
                                        .titleMediumNunitoGray50001)),
                            SizedBox(height: 8.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text("lbl_location_to".tr,
                                    style: CustomTextStyles
                                        .titleMediumNunitoGray50001)),
                            SizedBox(height: 19.v),
                            Divider(indent: 4.h, endIndent: 4.h),
                            SizedBox(height: 14.v),
                            Padding(
                                padding: EdgeInsets.only(left: 4.h),
                                child: Text("lbl_receiver".tr,
                                    style: CustomTextStyles
                                        .titleMediumNunitoGray80001)),
                            SizedBox(height: 63.v),
                            CustomElevatedButton(
                                height: 67.v,
                                text: "lbl_track_delivery".tr,
                                margin: EdgeInsets.symmetric(horizontal: 4.h),
                                buttonStyle: CustomButtonStyles.fillDeepPurpleA,
                                buttonTextStyle:
                                    CustomTextStyles.titleMediumNunitoWhiteA700)
                          ]))
                ])),
            bottomNavigationBar: _buildBottomBarSection(context)));
  }

  /// Section Widget
  Widget _buildArrowLeftSection(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 15.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL33),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 21.v),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeftBlack9000212x15,
                  height: 12.v,
                  width: 15.h,
                  onTap: () {
                    onTapImgArrowLeft(context);
                  })
            ]));
  }

  /// Section Widget
  Widget _buildFrameElevenSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 1.h, right: 7.h),
        padding: EdgeInsets.all(3.h),
        decoration: AppDecoration.outlineGray40001
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder24),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomImageView(
                  imagePath: ImageConstant.imgTicket,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 12.h, top: 8.v, bottom: 8.v)),
              Padding(
                  padding: EdgeInsets.only(left: 12.h, top: 11.v, bottom: 8.v),
                  child: Text("msg_810_per_member".tr,
                      style: CustomTextStyles.titleMediumDeeppurpleA700)),
              Spacer(),
              CustomElevatedButton(
                  height: 40.v,
                  width: 133.h,
                  text: "lbl_view_details".tr,
                  buttonStyle: CustomButtonStyles.fillPurpleA,
                  buttonTextStyle:
                      CustomTextStyles.titleMediumNunitoSecondaryContainer)
            ]));
  }

  /// Section Widget
  Widget _buildBottomBarSection(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Common widget
  Widget _buildFrameFiftySeven(
    BuildContext context, {
    required String deliveryFee,
    required String price,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(deliveryFee,
          style: CustomTextStyles.titleMediumNunitoGray50001
              .copyWith(color: appTheme.gray50001)),
      Text(price,
          style: CustomTextStyles.titleMediumDeeppurpleA700
              .copyWith(color: appTheme.deepPurpleA700))
    ]);
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.buyPage;
      case BottomBarEnum.Frame1000002310:
        return "/";
      case BottomBarEnum.Frame1000002311:
        return "/";
      case BottomBarEnum.Notification:
        return "/";
      case BottomBarEnum.Settings:
        return "/";
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(String currentRoute) {
    switch (currentRoute) {
      case AppRoutes.buyPage:
        return BuyPage();
      default:
        return DefaultWidget();
    }
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
