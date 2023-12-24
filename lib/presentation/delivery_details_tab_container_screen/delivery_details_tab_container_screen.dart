import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/presentation/delivery_details_page/delivery_details_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class DeliveryDetailsTabContainerScreen extends StatefulWidget {
  const DeliveryDetailsTabContainerScreen({Key? key}) : super(key: key);

  @override
  DeliveryDetailsTabContainerScreenState createState() =>
      DeliveryDetailsTabContainerScreenState();
}

// ignore_for_file: must_be_immutable
class DeliveryDetailsTabContainerScreenState
    extends State<DeliveryDetailsTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  _buildArrowLeftSection(context),
                  SizedBox(height: 41.v),
                  Container(
                      decoration: AppDecoration.fillWhiteA,
                      child: Column(children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: EdgeInsets.only(left: 16.h),
                                child: Text("msg_set_a_total_payment".tr,
                                    style: CustomTextStyles
                                        .titleMediumBlack90002))),
                        SizedBox(height: 23.v),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: _buildFrameFiftySeven(context,
                                deliveryFeeText: "lbl_subtotal".tr,
                                priceText: "lbl_8_000".tr)),
                        SizedBox(height: 9.v),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.h),
                            child: _buildFrameFiftySeven(context,
                                deliveryFeeText: "lbl_delivery_fee".tr,
                                priceText: "lbl_100".tr)),
                        SizedBox(height: 11.v),
                        Divider(indent: 20.h, endIndent: 20.h),
                        SizedBox(height: 14.v),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 19.h),
                            child: _buildFrameFiftySeven(context,
                                deliveryFeeText: "lbl_total".tr,
                                priceText: "lbl_8_100".tr)),
                        SizedBox(height: 25.v),
                        _buildTabview(context),
                        SizedBox(
                            height: 422.v,
                            child: TabBarView(
                                controller: tabviewController,
                                children: [
                                  DeliveryDetailsPage(),
                                  DeliveryDetailsPage()
                                ]))
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
              SizedBox(height: 20.v),
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
  Widget _buildTabview(BuildContext context) {
    return Container(
        height: 48.v,
        width: 350.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.h),
            border: Border.all(color: appTheme.gray40001, width: 1.h)),
        child: TabBar(
            controller: tabviewController,
            labelPadding: EdgeInsets.zero,
            labelColor: theme.colorScheme.secondaryContainer,
            labelStyle: TextStyle(
                fontSize: 17.fSize,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600),
            unselectedLabelColor: appTheme.deepPurpleA700,
            unselectedLabelStyle: TextStyle(
                fontSize: 16.fSize,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w500),
            indicatorPadding: EdgeInsets.all(4.0.h),
            indicator: BoxDecoration(
                color: appTheme.purpleA700.withOpacity(0.4),
                borderRadius: BorderRadius.circular(20.h)),
            tabs: [
              Tab(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    CustomImageView(
                        imagePath: ImageConstant.imgTicket,
                        height: 24.adaptSize,
                        width: 24.adaptSize),
                    Padding(
                        padding: EdgeInsets.only(left: 12.h, top: 3.v),
                        child: Text("msg_810_per_member".tr))
                  ])),
              Tab(
                  child: CustomElevatedButton(
                      height: 40.v,
                      width: 133.h,
                      text: "lbl_view_details".tr,
                      buttonStyle: CustomButtonStyles.fillPurpleA,
                      buttonTextStyle:
                          CustomTextStyles.titleMediumNunitoSecondaryContainer))
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
    required String deliveryFeeText,
    required String priceText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(deliveryFeeText,
          style: CustomTextStyles.titleMediumNunitoGray50001
              .copyWith(color: appTheme.gray50001)),
      Text(priceText,
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
