import '../set_c_screen/widgets/cartappcardlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class SetCScreen extends StatelessWidget {
  SetCScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 74.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Container(
                              height: 1647.v,
                              width: 386.h,
                              margin: EdgeInsets.only(right: 4.h),
                              child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            margin: EdgeInsets.only(left: 4.h),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 21.h,
                                                vertical: 30.v),
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomImageView(
                                                      imagePath: ImageConstant
                                                          .imgImage4187x338,
                                                      height: 187.v,
                                                      width: 338.h,
                                                      radius:
                                                          BorderRadius.circular(
                                                              16.h)),
                                                  SizedBox(height: 10.v),
                                                  Text("lbl_set_c2".tr,
                                                      style: CustomTextStyles
                                                          .titleLargeDMSansBluegray800),
                                                  SizedBox(height: 2.v),
                                                  Divider(endIndent: 11.h),
                                                  SizedBox(height: 13.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 3.h),
                                                      child: RichText(
                                                          text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        "lbl_created_on"
                                                                            .tr,
                                                                    style: CustomTextStyles
                                                                        .titleMediumOnErrorContainerBold),
                                                                TextSpan(
                                                                    text:
                                                                        "lbl_sept_30_2023"
                                                                            .tr,
                                                                    style: CustomTextStyles
                                                                        .titleMediumPurpleA700)
                                                              ]),
                                                          textAlign:
                                                              TextAlign.left)),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 4.h),
                                                      child: RichText(
                                                          text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                    text:
                                                                        "msg_contribution_started"
                                                                            .tr,
                                                                    style: CustomTextStyles
                                                                        .titleMediumOnErrorContainerBold),
                                                                TextSpan(
                                                                    text:
                                                                        "lbl_pending"
                                                                            .tr,
                                                                    style: CustomTextStyles
                                                                        .titleMediumPurpleA700)
                                                              ]),
                                                          textAlign:
                                                              TextAlign.left)),
                                                  SizedBox(height: 9.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8.h),
                                                      child: Text("lbl_menu".tr,
                                                          style: CustomTextStyles
                                                              .titleMediumBlack90002)),
                                                  SizedBox(height: 10.v),
                                                  _buildCartAppCardList(
                                                      context),
                                                  SizedBox(height: 14.v),
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 3.h),
                                                      child: Text(
                                                          "msg_available_slots"
                                                              .tr,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: CustomTextStyles
                                                              .titleMediumBlack90002)),
                                                  SizedBox(height: 20.v),
                                                  _buildVectorColumn(context),
                                                  SizedBox(height: 53.v)
                                                ]))),
                                    CustomImageView(
                                        imagePath:
                                            ImageConstant.imgEpArrowRightBold,
                                        height: 39.v,
                                        width: 29.h,
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(top: 93.v),
                                        onTap: () {
                                          onTapImgEpArrowRightBold(context);
                                        })
                                  ]))))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildCartAppCardList(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 6.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 11.v);
            },
            itemCount: 9,
            itemBuilder: (context, index) {
              return CartappcardlistItemWidget(onTapImgOverflowMenu: () {
                onTapImgOverflowMenu(context);
              });
            }));
  }

  /// Section Widget
  Widget _buildVectorColumn(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapVectorColumn(context);
        },
        child: Container(
            margin: EdgeInsets.only(left: 6.h, right: 3.h),
            padding: EdgeInsets.symmetric(horizontal: 156.h, vertical: 11.v),
            decoration: AppDecoration.fillGray40033
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
            child: CustomImageView(
                imagePath: ImageConstant.imgVectorBlack90002,
                height: 14.adaptSize,
                width: 14.adaptSize)));
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

  /// Navigates to the addMemberScreen when the action is triggered.
  onTapVectorColumn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addMemberScreen);
  }

  /// Navigates to the setBScreen when the action is triggered.
  onTapImgEpArrowRightBold(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.setBScreen);
  }
}
