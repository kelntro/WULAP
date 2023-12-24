import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_icon_button.dart';

class TrackDeliveryFullModalScreen extends StatelessWidget {
  const TrackDeliveryFullModalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            body: Container(
                width: mediaQueryData.size.width,
                height: mediaQueryData.size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageConstant.imgGroup734),
                        fit: BoxFit.cover)),
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.h, vertical: 8.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 8.h),
                              child: CustomIconButton(
                                  height: 44.adaptSize,
                                  width: 44.adaptSize,
                                  padding: EdgeInsets.all(10.h),
                                  decoration: IconButtonStyleHelper.fillPurpleA,
                                  onTap: () {
                                    onTapBtnCloseOutline(context);
                                  },
                                  child: CustomImageView(
                                      imagePath:
                                          ImageConstant.imgClose24Outline))),
                          Spacer(),
                          SizedBox(
                              height: 627.v,
                              width: 366.h,
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: Container(
                                            height: 448.v,
                                            width: 181.h,
                                            margin: EdgeInsets.only(
                                                top: 42.v, right: 55.h),
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: fs.Svg(ImageConstant
                                                        .imgVector1),
                                                    fit: BoxFit.cover)),
                                            child: Stack(
                                                alignment: Alignment.topLeft,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgVector2Green300,
                                                      height: 265.v,
                                                      width: 128.h,
                                                      alignment: Alignment
                                                          .bottomRight),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 32.h,
                                                          top: 176.v),
                                                      child: CustomIconButton(
                                                          height: 48.adaptSize,
                                                          width: 48.adaptSize,
                                                          padding:
                                                              EdgeInsets.all(
                                                                  12.h),
                                                          decoration:
                                                              IconButtonStyleHelper
                                                                  .outlineWhiteATL241,
                                                          alignment:
                                                              Alignment.topLeft,
                                                          child: CustomImageView(
                                                              imagePath:
                                                                  ImageConstant
                                                                      .imgArrowDownWhiteA700)))
                                                ]))),
                                    Padding(
                                        padding: EdgeInsets.only(left: 107.h),
                                        child: CustomIconButton(
                                            height: 48.adaptSize,
                                            width: 48.adaptSize,
                                            padding: EdgeInsets.all(12.h),
                                            decoration: IconButtonStyleHelper
                                                .outlineWhiteA,
                                            alignment: Alignment.topLeft,
                                            onTap: () {
                                              onTapBtnVuesaxBoldHome(context);
                                            },
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgVuesaxBoldHome))),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            right: 24.h, bottom: 142.v),
                                        child: CustomIconButton(
                                            height: 48.adaptSize,
                                            width: 48.adaptSize,
                                            padding: EdgeInsets.all(12.h),
                                            decoration: IconButtonStyleHelper
                                                .outlineWhiteATL242,
                                            alignment: Alignment.bottomRight,
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgSettingsGray90001))),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 18.h,
                                                vertical: 14.v),
                                            decoration: AppDecoration
                                                .outlineBluegray400011
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .circleBorder24),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Container(
                                                          width: 80.h,
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      8.h,
                                                                  vertical:
                                                                      1.v),
                                                          decoration: AppDecoration
                                                              .fillPurple5001
                                                              .copyWith(
                                                                  borderRadius:
                                                                      BorderRadiusStyle
                                                                          .circleBorder12),
                                                          child: Text(
                                                              "lbl_seta_33".tr,
                                                              style: CustomTextStyles
                                                                  .titleSmallNunito))),
                                                  SizedBox(height: 23.v),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 39.h),
                                                          child: Row(children: [
                                                            Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      "lbl_remaining_time"
                                                                          .tr,
                                                                      style: CustomTextStyles
                                                                          .bodyLargeNunitoBluegray900_1),
                                                                  Text(
                                                                      "lbl_2mins"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .headlineSmall)
                                                                ]),
                                                            Spacer(flex: 50),
                                                            SizedBox(
                                                                height: 57.v,
                                                                child: VerticalDivider(
                                                                    width: 1.h,
                                                                    thickness:
                                                                        1.v,
                                                                    color: appTheme
                                                                        .gray60002)),
                                                            Spacer(flex: 49),
                                                            Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      "lbl_estimated_time"
                                                                          .tr,
                                                                      style: CustomTextStyles
                                                                          .bodyLargeNunitoBluegray900_1),
                                                                  SizedBox(
                                                                      height:
                                                                          1.v),
                                                                  Text(
                                                                      "lbl_15mins"
                                                                          .tr,
                                                                      style: theme
                                                                          .textTheme
                                                                          .headlineSmall)
                                                                ])
                                                          ]))),
                                                  SizedBox(height: 24.v),
                                                  Divider(
                                                      color:
                                                          appTheme.gray80001),
                                                  SizedBox(height: 22.v),
                                                  _buildDeliveryDetails(
                                                      context),
                                                  SizedBox(height: 39.v),
                                                  _buildDriverDetails(context)
                                                ])))
                                  ]))
                        ])))));
  }

  /// Section Widget
  Widget _buildDeliveryDetails(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 6.h),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("lbl_from".tr,
                style: CustomTextStyles.bodyLargeNunitoBluegray900),
            SizedBox(height: 5.v),
            Text("msg_oba_akinjoba_str".tr,
                style: CustomTextStyles.titleMediumNunitoPurpleA700)
          ]),
          CustomImageView(
              imagePath: ImageConstant.imgLine7,
              height: 1.v,
              width: 30.h,
              margin: EdgeInsets.only(top: 24.v, bottom: 23.v)),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("lbl_to".tr,
                style: CustomTextStyles.bodyLargeNunitoBluegray900),
            SizedBox(height: 4.v),
            Text("msg_a152_conoil_rd".tr,
                style: CustomTextStyles.titleMediumNunitoPurpleA700)
          ])
        ]));
  }

  /// Section Widget
  Widget _buildDriverDetails(BuildContext context) {
    return Container(
        width: 326.h,
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
        decoration: AppDecoration.fillPurple50011
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("lbl_driver_details".tr,
                  style: CustomTextStyles.titleLargeNunitoBlack90002),
              SizedBox(height: 12.v),
              Row(children: [
                CustomImageView(
                    imagePath: ImageConstant.imgRectangle27,
                    height: 56.adaptSize,
                    width: 56.adaptSize,
                    radius: BorderRadius.circular(28.h)),
                Padding(
                    padding: EdgeInsets.only(left: 16.h, top: 6.v, bottom: 6.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("msg_marcus_santorini".tr,
                              style: CustomTextStyles
                                  .titleMediumNunitoBluegray900),
                          SizedBox(height: 1.v),
                          Text("lbl_id_101d12345".tr,
                              style: CustomTextStyles
                                  .bodyMediumNunitoDeeppurpleA700)
                        ]))
              ]),
              SizedBox(height: 24.v),
              Padding(
                  padding: EdgeInsets.only(right: 25.h),
                  child: Row(children: [
                    CustomElevatedButton(
                        height: 48.v,
                        width: 137.h,
                        text: "lbl_call_driver".tr,
                        leftIcon: Container(
                            margin: EdgeInsets.only(right: 4.h),
                            child: CustomImageView(
                                imagePath: ImageConstant.imgWhatsapp,
                                height: 24.adaptSize,
                                width: 24.adaptSize)),
                        buttonStyle: CustomButtonStyles.fillDeepPurpleATL24,
                        buttonTextStyle:
                            CustomTextStyles.titleMediumNunitoWhiteA700),
                    CustomImageView(
                        imagePath: ImageConstant.imgMenu,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin: EdgeInsets.only(
                            left: 30.h, top: 12.v, bottom: 12.v)),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 8.h, top: 13.v, bottom: 10.v),
                        child: Text("lbl_message".tr,
                            style: CustomTextStyles
                                .titleMediumNunitoBluegray900SemiBold))
                  ]))
            ]));
  }

  /// Navigates to the deliveryDetailsTabContainerScreen when the action is triggered.
  onTapBtnCloseOutline(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.deliveryDetailsTabContainerScreen);
  }

  /// Navigates to the oderDeliveryManagemaentThreeScreen when the action is triggered.
  onTapBtnVuesaxBoldHome(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.oderDeliveryManagemaentThreeScreen);
  }
}
