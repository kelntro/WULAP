import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  Container(
                      height: 48.v,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: appTheme.whiteA700,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(33.h)))),
                  SizedBox(height: 5.v),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 19.h, vertical: 20.v),
                      decoration: AppDecoration.fillWhiteA.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder30),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 13.v),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomImageView(
                                      imagePath: ImageConstant
                                          .imgArrowLeftBlueGray80024x24,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                      margin: EdgeInsets.only(bottom: 52.v),
                                      onTap: () {
                                        onTapImgArrowLeft(context);
                                      }),
                                  CustomImageView(
                                      imagePath:
                                          ImageConstant.imgEllipse4664x64,
                                      height: 64.adaptSize,
                                      width: 64.adaptSize,
                                      radius: BorderRadius.circular(32.h),
                                      margin: EdgeInsets.only(
                                          left: 120.h, top: 12.v))
                                ]),
                            SizedBox(height: 26.v),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 4.h, right: 22.h),
                                child: _buildContact(context,
                                    contactLabel: "msg_basic_information".tr,
                                    editLabel: "lbl_edit".tr, onTapEdit: () {
                                  onTapTxtEdit(context);
                                })),
                            SizedBox(height: 4.v),
                            _buildBasicInformation1(context),
                            SizedBox(height: 16.v),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 4.h, right: 22.h),
                                child: _buildContact(context,
                                    contactLabel: "lbl_contact".tr,
                                    editLabel: "lbl_edit".tr, onTapEdit: () {
                                  onTapTxtEdit1(context);
                                })),
                            SizedBox(height: 4.v),
                            _buildMobileNumbers(context),
                            SizedBox(height: 18.v),
                            Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                    onTap: () {
                                      onTapTxtEdit2(context);
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(right: 22.h),
                                        child: Text("lbl_edit".tr,
                                            style: CustomTextStyles
                                                .labelLargeDMSansPrimary))))
                          ]))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildBasicInformation1(BuildContext context) {
    return SizedBox(
        height: 224.v,
        width: 351.h,
        child: Stack(alignment: Alignment.topCenter, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  margin: EdgeInsets.only(right: 1.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 4.v),
                  decoration: AppDecoration.fillPurpleA7003
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 1.v),
                        _buildLastName(context,
                            lastName: "lbl_first_name".tr, doe: "lbl_jane".tr),
                        SizedBox(height: 12.v),
                        _buildLastName(context,
                            lastName: "lbl_last_name".tr, doe: "lbl_doe".tr),
                        SizedBox(height: 12.v),
                        _buildLastName(context,
                            lastName: "msg_system_member_id".tr,
                            doe: "lbl_1230002".tr),
                        SizedBox(height: 10.v),
                        _buildLastName(context,
                            lastName: "lbl_member_id".tr,
                            doe: "lbl_username2".tr),
                        SizedBox(height: 10.v),
                        _buildLastName(context,
                            lastName: "lbl_gender".tr, doe: "lbl_female".tr),
                        SizedBox(height: 12.v),
                        _buildLastName(context,
                            lastName: "lbl_marital_status".tr,
                            doe: "lbl_single".tr),
                        SizedBox(height: 10.v),
                        _buildLastName(context,
                            lastName: "lbl_date_of_birth".tr,
                            doe: "lbl_23_may_1998".tr),
                        SizedBox(height: 10.v),
                        _buildLastName(context,
                            lastName: "lbl_joined_date".tr,
                            doe: "msg_14_september_2023".tr)
                      ]))),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: 28.v),
                  child: SizedBox(
                      width: 350.h,
                      child: Divider(
                          color: appTheme.purpleA700.withOpacity(0.05))))),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: 56.v),
                  child: SizedBox(
                      width: 350.h,
                      child: Divider(
                          color: appTheme.purpleA700.withOpacity(0.05))))),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: 85.v),
                  child: SizedBox(
                      width: 350.h,
                      child: Divider(
                          color: appTheme.purpleA700.withOpacity(0.05))))),
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: 350.h,
                  child:
                      Divider(color: appTheme.purpleA700.withOpacity(0.05)))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 82.v),
                  child: SizedBox(
                      width: 350.h,
                      child: Divider(
                          color: appTheme.purpleA700.withOpacity(0.05))))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 54.v),
                  child: SizedBox(
                      width: 350.h,
                      child: Divider(
                          color: appTheme.purpleA700.withOpacity(0.05))))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 26.v),
                  child: SizedBox(
                      width: 350.h,
                      child: Divider(
                          color: appTheme.purpleA700.withOpacity(0.05)))))
        ]));
  }

  /// Section Widget
  Widget _buildMobileNumbers(BuildContext context) {
    return SizedBox(
        height: 113.v,
        width: 351.h,
        child: Stack(alignment: Alignment.topCenter, children: [
          Align(
              alignment: Alignment.center,
              child: Container(
                  margin: EdgeInsets.only(right: 1.h),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.h, vertical: 4.v),
                  decoration: AppDecoration.fillPurpleA7003
                      .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    _buildLastName(context,
                        lastName: "lbl_monile_number_1".tr,
                        doe: "lbl_09234567880".tr),
                    SizedBox(height: 11.v),
                    _buildLastName(context,
                        lastName: "lbl_mobile_number_2".tr,
                        doe: "lbl_094797629628".tr),
                    SizedBox(height: 12.v),
                    _buildLastName(context,
                        lastName: "lbl_email_address2".tr,
                        doe: "msg_janedoe_gmail_com".tr),
                    SizedBox(height: 11.v),
                    _buildLastName(context,
                        lastName: "msg_physical_address".tr,
                        doe: "msg_p_2_brgy_mintal".tr)
                  ]))),
          Align(
              alignment: Alignment.topCenter,
              child: Padding(
                  padding: EdgeInsets.only(top: 28.v),
                  child: SizedBox(
                      width: 350.h,
                      child: Divider(
                          color: appTheme.purpleA700.withOpacity(0.05))))),
          Align(
              alignment: Alignment.center,
              child: SizedBox(
                  width: 350.h,
                  child:
                      Divider(color: appTheme.purpleA700.withOpacity(0.05)))),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 27.v),
                  child: SizedBox(
                      width: 350.h,
                      child: Divider(
                          color: appTheme.purpleA700.withOpacity(0.05)))))
        ]));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Common widget
  Widget _buildLastName(
    BuildContext context, {
    required String lastName,
    required String doe,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Opacity(
          opacity: 0.8,
          child: Text(lastName,
              style: CustomTextStyles.bodySmallBluegray800
                  .copyWith(color: appTheme.blueGray800.withOpacity(0.64)))),
      Opacity(
          opacity: 0.8,
          child: Text(doe,
              style: CustomTextStyles.bodySmallBluegray800
                  .copyWith(color: appTheme.blueGray800.withOpacity(0.64))))
    ]);
  }

  /// Common widget
  Widget _buildContact(
    BuildContext context, {
    required String contactLabel,
    required String editLabel,
    Function? onTapEdit,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(contactLabel,
          style: CustomTextStyles.titleSmallBluegray800Medium
              .copyWith(color: appTheme.blueGray800)),
      GestureDetector(onTap: () {
        onTapEdit!.call();
      }),
      Padding(
          padding: EdgeInsets.only(top: 2.v),
          child: Text(editLabel,
              style: CustomTextStyles.labelLargeDMSansPrimary
                  .copyWith(color: theme.colorScheme.primary)))
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

  /// Navigates to the basicInfoScreen when the action is triggered.
  onTapTxtEdit(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.basicInfoScreen);
  }

  /// Navigates to the profEditScreen when the action is triggered.
  onTapTxtEdit1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profEditScreen);
  }

  /// Navigates to the profSaveScreen when the action is triggered.
  onTapTxtEdit2(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.profSaveScreen);
  }
}
