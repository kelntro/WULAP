import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_floating_button.dart';
import 'package:wulap_application/widgets/custom_icon_button.dart';

class TrackDeliveryScreen extends StatelessWidget {
  const TrackDeliveryScreen({Key? key}) : super(key: key);

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
                    width: 303.h,
                    margin: EdgeInsets.only(right: 46.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomIconButton(
                              height: 44.adaptSize,
                              width: 44.adaptSize,
                              padding: EdgeInsets.all(10.h),
                              decoration: IconButtonStyleHelper.fillPurpleA,
                              onTap: () {
                                onTapBtnCloseOutline(context);
                              },
                              child: CustomImageView(
                                  imagePath: ImageConstant.imgClose24Outline)),
                          Spacer(),
                          Align(
                              alignment: Alignment.centerRight,
                              child: SizedBox(
                                  height: 490.v,
                                  width: 204.h,
                                  child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        CustomImageView(
                                            imagePath: ImageConstant.imgVector1,
                                            height: 448.v,
                                            width: 181.h,
                                            alignment: Alignment.bottomRight),
                                        CustomImageView(
                                            imagePath: ImageConstant.imgVector2,
                                            height: 265.v,
                                            width: 128.h,
                                            alignment: Alignment.bottomRight),
                                        CustomIconButton(
                                            height: 48.adaptSize,
                                            width: 48.adaptSize,
                                            padding: EdgeInsets.all(12.h),
                                            decoration: IconButtonStyleHelper
                                                .outlineWhiteA,
                                            alignment: Alignment.topLeft,
                                            child: CustomImageView(
                                                imagePath: ImageConstant
                                                    .imgVuesaxBoldHome)),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 55.h),
                                            child: CustomIconButton(
                                                height: 48.adaptSize,
                                                width: 48.adaptSize,
                                                padding: EdgeInsets.all(12.h),
                                                decoration:
                                                    IconButtonStyleHelper
                                                        .outlineWhiteATL24,
                                                alignment: Alignment.centerLeft,
                                                child: CustomImageView(
                                                    imagePath: ImageConstant
                                                        .imgArrowDownWhiteA700)))
                                      ])))
                        ]))),
            bottomNavigationBar: _buildTrackDelivery(context),
            floatingActionButton: _buildFloatingActionButton(context)));
  }

  /// Section Widget
  Widget _buildTrackDelivery(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 12.h, right: 51.h, bottom: 24.v),
        decoration: AppDecoration.outlineBluegray40001
            .copyWith(borderRadius: BorderRadiusStyle.circleBorder24),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 80.h,
                  padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 1.v),
                  decoration: AppDecoration.fillPurpleA7002
                      .copyWith(borderRadius: BorderRadiusStyle.circleBorder12),
                  child: Text("lbl_seta_33".tr,
                      style: CustomTextStyles.titleSmallNunitoGray900)),
              Padding(
                  padding: EdgeInsets.only(top: 15.v),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_remaining_time".tr,
                                  style: CustomTextStyles
                                      .bodyLargeNunitoBluegray900_1),
                              Text("lbl_2mins".tr,
                                  style: theme.textTheme.headlineSmall)
                            ]),
                        SizedBox(
                            height: 57.v,
                            child: VerticalDivider(
                                width: 1.h,
                                thickness: 1.v,
                                color: appTheme.gray60002)),
                        Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("lbl_estimated_time".tr,
                                  style: CustomTextStyles
                                      .bodyLargeNunitoBluegray900_1),
                              Padding(
                                  padding: EdgeInsets.only(top: 1.v),
                                  child: Text("lbl_15mins".tr,
                                      style: theme.textTheme.headlineSmall))
                            ])
                      ]))
            ]));
  }

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return CustomFloatingButton(
        height: 48,
        width: 48,
        backgroundColor: appTheme.purpleA100,
        decoration: FloatingButtonStyleHelper.outlineWhiteATL24,
        child: CustomImageView(
            imagePath: ImageConstant.imgProfileWhiteA700,
            height: 24.0.v,
            width: 24.0.h));
  }

  /// Navigates to the deliveryDetailsTabContainerScreen when the action is triggered.
  onTapBtnCloseOutline(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.deliveryDetailsTabContainerScreen);
  }
}
