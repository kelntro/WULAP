import 'package:wulap_application/widgets/app_bar/appbar_subtitle.dart';

import '../set_a_screen/widgets/cartappcardlist3_item_widget.dart';
import '../set_a_screen/widgets/userprofilelist1_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SetAScreen extends StatelessWidget {
  SetAScreen({Key? key}) : super(key: key);

  TextEditingController overflowMenuEditText1Controller =
      TextEditingController();

  TextEditingController overflowMenuEditText2Controller =
      TextEditingController();

  TextEditingController overflowMenuEditText3Controller =
      TextEditingController();

  TextEditingController overflowMenuEditText4Controller =
      TextEditingController();

  TextEditingController overflowMenuEditText5Controller =
      TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 0.v),
                    child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 0.h),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.h, vertical: 27.v),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 0.v),
                              CustomImageView(
                                  imagePath: ImageConstant.imgRectangle55,
                                  height: 187.v,
                                  width: 338.h,
                                  radius: BorderRadius.circular(20.h)),
                              SizedBox(height: 10.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 3.h),
                                  child: Text("lbl_set_a2".tr,
                                      style: CustomTextStyles
                                          .titleLargeDMSansBluegray800)),
                              SizedBox(height: 2.v),
                              Divider(indent: 1.h, endIndent: 12.h),
                              SizedBox(height: 13.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 4.h),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "lbl_created_on".tr,
                                            style: CustomTextStyles
                                                .titleMediumOnErrorContainerBold),
                                        TextSpan(
                                            text: "lbl_sept_30_2023".tr,
                                            style: CustomTextStyles
                                                .titleMediumPurpleA700)
                                      ]),
                                      textAlign: TextAlign.left)),
                              Padding(
                                  padding: EdgeInsets.only(left: 4.h),
                                  child: RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "msg_contribution_started".tr,
                                            style: CustomTextStyles
                                                .titleMediumOnErrorContainerBold),
                                        TextSpan(
                                            text: "lbl_oct_5_2023".tr,
                                            style: CustomTextStyles
                                                .titleMediumPurpleA700)
                                      ]),
                                      textAlign: TextAlign.left)),
                              SizedBox(height: 8.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 9.h),
                                  child: Text("lbl_menu".tr,
                                      style: CustomTextStyles
                                          .titleMediumBlack90002)),
                              SizedBox(height: 10.v),
                              _buildCartAppCardList(context),
                              SizedBox(height: 22.v),
                              Padding(
                                  padding: EdgeInsets.only(left: 7.h),
                                  child: Text("msg_october_s_receiver".tr,
                                      textAlign: TextAlign.center,
                                      style: CustomTextStyles
                                          .titleMediumBlack90002)),
                              SizedBox(height: 7.v),
                              Container(
                                  height: 640.v,
                                  width: 332.h,
                                  margin: EdgeInsets.only(left: 7.h),
                                  child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Align(
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.h, top: 130.v),
                                                child: Text("lbl_members".tr,
                                                    textAlign: TextAlign.center,
                                                    style: CustomTextStyles
                                                        .titleMediumBlack90002))),
                                        Align(
                                            alignment: Alignment.center,
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  _buildTonyHerzRow(context),
                                                  SizedBox(height: 42.v),
                                                  _buildJulieWilliamsRow(
                                                      context),
                                                  SizedBox(height: 10.v),
                                                  _buildOverflowMenuStack1(
                                                      context),
                                                  SizedBox(height: 10.v),
                                                  _buildOverflowMenuStack2(
                                                      context),
                                                  SizedBox(height: 10.v),
                                                  _buildOverflowMenuStack3(
                                                      context),
                                                  SizedBox(height: 10.v),
                                                  _buildOverflowMenuStack4(
                                                      context),
                                                  SizedBox(height: 58.v),
                                                  Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 83.h),
                                                          child: Text(
                                                              "lbl_august".tr,
                                                              style: CustomTextStyles
                                                                  .dMSansGray800)))
                                                ])),
                                        _buildOverflowMenuEditText5(context)
                                      ])),
                              SizedBox(height: 10.v),
                              _buildUserProfileList(context)
                            ])))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 80,
        leadingWidth: 80,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgProfile34x34,
            margin: EdgeInsets.only(
              left: 20.h,
              top: 11.v,
              bottom: 11.v,
            )),
        title: AppbarSubtitle(
            text: "Paluwagan Management".tr,
            margin: EdgeInsets.only(left: 14.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgShare,
              margin: EdgeInsets.only(left: 4.h, top: 27.v, right: 4.h),
              onTap: () {
                onTapShare(context);
              }),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgDotVertical,
              margin: EdgeInsets.only(left: 4.h, top: 27.v, right: 4.h))
        ],
        styleType: Style.bgStyle);
  }

  /// Section Widget
  Widget _buildCartAppCardList(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 3.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 11.v);
            },
            itemCount: 9,
            itemBuilder: (context, index) {
              return Cartappcardlist3ItemWidget(onTapImgOverflowMenu: () {
                onTapImgOverflowMenu(context);
              });
            }));
  }

  /// Section Widget
  Widget _buildTonyHerzRow(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 23.h, vertical: 31.v),
        decoration: AppDecoration.fillGray40033
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomImageView(
              imagePath: ImageConstant.imgEllipse5951x50,
              height: 51.v,
              width: 50.h,
              radius: BorderRadius.circular(25.h)),
          SizedBox(
              height: 51.v,
              width: 129.h,
              child: Stack(alignment: Alignment.topLeft, children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                        padding: EdgeInsets.only(bottom: 4.v),
                        child: Text("lbl_tony_herz".tr,
                            style: theme.textTheme.titleMedium))),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.only(top: 14.v),
                        child: Text("msg_this_month_of_october".tr,
                            style: CustomTextStyles.dMSansGray800))),
                Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                        height: 51.v,
                        width: 50.h,
                        child: Stack(alignment: Alignment.center, children: [
                          CustomImageView(
                              imagePath: ImageConstant.imgEllipse60,
                              height: 51.v,
                              width: 50.h,
                              alignment: Alignment.center),
                          CustomImageView(
                              imagePath:
                                  ImageConstant.imgCalendarTodayDeepPurpleA700,
                              height: 24.adaptSize,
                              width: 24.adaptSize,
                              alignment: Alignment.center)
                        ])))
              ])),
          Padding(
              padding: EdgeInsets.only(top: 13.v, bottom: 6.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 1.h),
                        child: Text("lbl_deliver_date2".tr,
                            style: CustomTextStyles.dMSansGray800)),
                    SizedBox(height: 4.v),
                    Text("lbl_oct_20".tr, style: theme.textTheme.titleMedium)
                  ])),
          CustomImageView(
              imagePath: ImageConstant.imgOverflowMenu,
              height: 24.adaptSize,
              width: 24.adaptSize,
              margin: EdgeInsets.symmetric(vertical: 14.v))
        ]));
  }

  /// Section Widget
  Widget _buildJulieWilliamsRow(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 13.v),
        decoration: AppDecoration.fillGray40033
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          CustomImageView(
              imagePath: ImageConstant.imgEllipse5945x44,
              height: 45.v,
              width: 44.h,
              radius: BorderRadius.circular(22.h),
              margin: EdgeInsets.only(left: 5.h, bottom: 1.v)),
          Padding(
              padding: EdgeInsets.only(left: 12.h, top: 13.v, bottom: 4.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_julie_williams".tr,
                        style: theme.textTheme.titleMedium),
                    Text("lbl_february".tr,
                        style: CustomTextStyles.dMSansGray800)
                  ])),
          Spacer(),
          CustomImageView(
              imagePath: ImageConstant.imgOverflowMenu,
              height: 24.v,
              width: 23.h,
              margin: EdgeInsets.symmetric(vertical: 11.v))
        ]));
  }

  /// Section Widget
  Widget _buildOverflowMenuEditText1(BuildContext context) {
    return CustomTextFormField(
        width: 330.h,
        controller: overflowMenuEditText1Controller,
        hintText: "lbl_liam_smith".tr,
        hintStyle: theme.textTheme.titleMedium!,
        alignment: Alignment.center,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(26.h, 13.v, 12.h, 14.v),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(22.h)),
            child: CustomImageView(
                imagePath: ImageConstant.imgEllipse599,
                height: 45.v,
                width: 44.h)),
        prefixConstraints: BoxConstraints(maxHeight: 72.v),
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 24.v, 20.h, 24.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgOverflowMenu,
                height: 24.v,
                width: 23.h)),
        suffixConstraints: BoxConstraints(maxHeight: 72.v),
        contentPadding: EdgeInsets.symmetric(vertical: 26.v),
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        filled: true,
        fillColor: appTheme.gray40033);
  }

  /// Section Widget
  Widget _buildOverflowMenuStack1(BuildContext context) {
    return SizedBox(
        height: 72.v,
        width: 330.h,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 85.h, bottom: 17.v),
                  child: Text("lbl_november".tr,
                      style: CustomTextStyles.dMSansGray800))),
          _buildOverflowMenuEditText1(context)
        ]));
  }

  /// Section Widget
  Widget _buildOverflowMenuEditText2(BuildContext context) {
    return CustomTextFormField(
        width: 330.h,
        controller: overflowMenuEditText2Controller,
        hintText: "lbl_jason_wang".tr,
        hintStyle: theme.textTheme.titleMedium!,
        alignment: Alignment.center,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(26.h, 13.v, 12.h, 14.v),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(22.h)),
            child: CustomImageView(
                imagePath: ImageConstant.imgEllipse5910,
                height: 45.v,
                width: 44.h)),
        prefixConstraints: BoxConstraints(maxHeight: 72.v),
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 24.v, 20.h, 24.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgOverflowMenu,
                height: 24.v,
                width: 23.h)),
        suffixConstraints: BoxConstraints(maxHeight: 72.v),
        contentPadding: EdgeInsets.symmetric(vertical: 26.v),
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        filled: true,
        fillColor: appTheme.gray40033);
  }

  /// Section Widget
  Widget _buildOverflowMenuStack2(BuildContext context) {
    return SizedBox(
        height: 72.v,
        width: 330.h,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 85.h, bottom: 17.v),
                  child: Text("lbl_may".tr,
                      style: CustomTextStyles.dMSansGray800))),
          _buildOverflowMenuEditText2(context)
        ]));
  }

  /// Section Widget
  Widget _buildOverflowMenuEditText3(BuildContext context) {
    return CustomTextFormField(
        width: 330.h,
        controller: overflowMenuEditText3Controller,
        hintText: "lbl_min_ho_lee".tr,
        hintStyle: theme.textTheme.titleMedium!,
        alignment: Alignment.center,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(26.h, 13.v, 11.h, 14.v),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(22.h)),
            child: CustomImageView(
                imagePath: ImageConstant.imgEllipse5911,
                height: 45.v,
                width: 44.h)),
        prefixConstraints: BoxConstraints(maxHeight: 72.v),
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 24.v, 21.h, 24.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgOverflowMenu,
                height: 24.v,
                width: 23.h)),
        suffixConstraints: BoxConstraints(maxHeight: 72.v),
        contentPadding: EdgeInsets.symmetric(vertical: 26.v),
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        filled: true,
        fillColor: appTheme.gray40033);
  }

  /// Section Widget
  Widget _buildOverflowMenuStack3(BuildContext context) {
    return SizedBox(
        height: 72.v,
        width: 330.h,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 83.h, bottom: 17.v),
                  child: Text("lbl_june".tr,
                      style: CustomTextStyles.dMSansGray800))),
          _buildOverflowMenuEditText3(context)
        ]));
  }

  /// Section Widget
  Widget _buildOverflowMenuEditText4(BuildContext context) {
    return CustomTextFormField(
        width: 330.h,
        controller: overflowMenuEditText4Controller,
        hintText: "lbl_cha_eunwoo".tr,
        hintStyle: theme.textTheme.titleMedium!,
        alignment: Alignment.center,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(26.h, 13.v, 11.h, 14.v),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(22.h)),
            child: CustomImageView(
                imagePath: ImageConstant.imgEllipse5912,
                height: 45.v,
                width: 44.h)),
        prefixConstraints: BoxConstraints(maxHeight: 72.v),
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 26.v, 21.h, 22.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgOverflowMenu,
                height: 24.v,
                width: 23.h)),
        suffixConstraints: BoxConstraints(maxHeight: 72.v),
        contentPadding: EdgeInsets.symmetric(vertical: 26.v),
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        filled: true,
        fillColor: appTheme.gray40033);
  }

  /// Section Widget
  Widget _buildOverflowMenuStack4(BuildContext context) {
    return SizedBox(
        height: 72.v,
        width: 330.h,
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 84.h, bottom: 17.v),
                  child: Text("lbl_july".tr,
                      style: CustomTextStyles.dMSansGray800))),
          _buildOverflowMenuEditText4(context)
        ]));
  }

  /// Section Widget
  Widget _buildOverflowMenuEditText5(BuildContext context) {
    return CustomTextFormField(
        width: 330.h,
        controller: overflowMenuEditText5Controller,
        hintText: "lbl_leah_lee".tr,
        hintStyle: theme.textTheme.titleMedium!,
        textInputAction: TextInputAction.done,
        alignment: Alignment.bottomCenter,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(26.h, 13.v, 12.h, 14.v),
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(22.h)),
            child: CustomImageView(
                imagePath: ImageConstant.imgEllipse5913,
                height: 45.v,
                width: 44.h)),
        prefixConstraints: BoxConstraints(maxHeight: 72.v),
        suffix: Container(
            margin: EdgeInsets.fromLTRB(30.h, 24.v, 20.h, 24.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgOverflowMenu,
                height: 24.v,
                width: 23.h)),
        suffixConstraints: BoxConstraints(maxHeight: 72.v),
        contentPadding: EdgeInsets.symmetric(vertical: 26.v),
        borderDecoration: TextFormFieldStyleHelper.fillGray,
        filled: true,
        fillColor: appTheme.gray40033);
  }

  /// Section Widget
  Widget _buildUserProfileList(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h, right: 4.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.v);
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return Userprofilelist1ItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
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

  /// Navigates to the foodInfoScreen when the action is triggered.
  onTapImgOverflowMenu(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.foodInfoScreen);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the myPostsScreen when the action is triggered.
  onTapShare(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myPostsScreen);
  }
}
