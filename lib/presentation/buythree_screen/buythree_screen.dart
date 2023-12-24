import '../buythree_screen/widgets/fooditems_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class BuythreeScreen extends StatelessWidget {
  BuythreeScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Column(children: [
                  SizedBox(height: 10.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgArrowLeftBlack9000212x15,
                      height: 12.v,
                      width: 15.h,
                      alignment: Alignment.centerLeft,
                      onTap: () {
                        onTapImgArrowLeft(context);
                      }),
                  SizedBox(height: 14.v),
                  Text("lbl_mcdonald_s".tr,
                      style: CustomTextStyles.bodyLargeABeeZeeBlack90018),
                  SizedBox(height: 20.v),
                  _buildFoodItems(context),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Opacity(
                          opacity: 0.64,
                          child: Container(
                              width: 205.h,
                              margin: EdgeInsets.only(left: 50.h),
                              child: Text("msg_shortbread_chocolate".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles
                                      .bodyLargeABeeZeeBlack900
                                      .copyWith(height: 1.50))))),
                  SizedBox(height: 71.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Opacity(
                          opacity: 0.64,
                          child: Container(
                              width: 205.h,
                              margin: EdgeInsets.only(left: 50.h),
                              child: Text("msg_shortbread_chocolate".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles
                                      .bodyLargeABeeZeeBlack900
                                      .copyWith(height: 1.50))))),
                  SizedBox(height: 71.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Opacity(
                          opacity: 0.64,
                          child: Container(
                              width: 205.h,
                              margin: EdgeInsets.only(left: 50.h),
                              child: Text("msg_shortbread_chocolate".tr,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: CustomTextStyles
                                      .bodyLargeABeeZeeBlack900
                                      .copyWith(height: 1.50))))),
                  SizedBox(height: 42.v),
                  Padding(
                      padding: EdgeInsets.only(left: 10.h, right: 5.h),
                      child: _buildTotalInclVAT(context,
                          totalInclVatText: "msg_subtotal_delivery".tr,
                          audThirtyText: "lbl_p1397_p0".tr)),
                  Padding(
                      padding: EdgeInsets.only(left: 10.h, right: 5.h),
                      child: _buildTotalInclVAT(context,
                          totalInclVatText: "msg_total_incl_vat".tr,
                          audThirtyText: "lbl_p1397".tr)),
                  SizedBox(height: 26.v),
                  Padding(
                      padding: EdgeInsets.only(left: 10.h, right: 5.h),
                      child: _buildAddMoreCopy(context,
                          promoCodeText: "lbl_add_more_items".tr)),
                  SizedBox(height: 33.v),
                  Padding(
                      padding: EdgeInsets.only(left: 10.h, right: 5.h),
                      child: _buildAddMoreCopy(context,
                          promoCodeText: "lbl_promo_code".tr)),
                  SizedBox(height: 64.v),
                  CustomElevatedButton(
                      height: 48.v,
                      text: "msg_checkout_p1397".tr.toUpperCase(),
                      margin: EdgeInsets.only(left: 10.h, right: 5.h),
                      buttonTextStyle:
                          CustomTextStyles.bodyMediumABeeZeeWhiteA700,
                      onPressed: () {
                        onTapCheckoutP1397(context);
                      })
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildFoodItems(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10.h, right: 5.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 47.5.v),
                  child: SizedBox(
                      width: 335.h,
                      child: Divider(
                          height: 1.v,
                          thickness: 1.v,
                          color: appTheme.gray70019)));
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return FooditemsItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Common widget
  Widget _buildTotalInclVAT(
    BuildContext context, {
    required String totalInclVatText,
    required String audThirtyText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "lbl_total".tr,
                style: CustomTextStyles.bodyLargeABeeZeeBlack900_3),
            TextSpan(
                text: "lbl_incl_vat".tr,
                style: CustomTextStyles.bodyLargeABeeZeeBlack900_3)
          ]),
          textAlign: TextAlign.left),
      Padding(
          padding: EdgeInsets.only(bottom: 2.v),
          child: Text(audThirtyText,
              style: CustomTextStyles.bodyMediumABeeZeePrimary_1
                  .copyWith(color: theme.colorScheme.primary)))
    ]);
  }

  /// Common widget
  Widget _buildAddMoreCopy(
    BuildContext context, {
    required String promoCodeText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Opacity(
          opacity: 0.84,
          child: Padding(
              padding: EdgeInsets.only(top: 1.v, bottom: 3.v),
              child: Text(promoCodeText,
                  style: CustomTextStyles.bodyLargeABeeZeeBlack900_4
                      .copyWith(color: appTheme.black900.withOpacity(0.65))))),
      CustomImageView(
          imagePath: ImageConstant.imgArrowRightBlack900,
          height: 24.adaptSize,
          width: 24.adaptSize)
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

  /// Navigates to the successOneScreen when the action is triggered.
  onTapCheckoutP1397(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.successOneScreen);
  }
}
