import '../set_b_screen/widgets/cartappcardlist2_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SetBScreen extends StatelessWidget {
  SetBScreen({Key? key}) : super(key: key);

  TextEditingController overflowmenuController = TextEditingController();

  TextEditingController overflowmenuController1 = TextEditingController();

  TextEditingController overflowmenuController2 = TextEditingController();

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
                    padding: EdgeInsets.only(top: 47.v),
                    child: Container(
                        height: 1933.v,
                        width: 388.h,
                        margin: EdgeInsets.only(right: 2.h),
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  margin:
                                      EdgeInsets.only(left: 4.h, right: 2.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 21.h, vertical: 27.v),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomImageView(
                                            imagePath: ImageConstant.imgImage41,
                                            height: 187.v,
                                            width: 338.h,
                                            radius: BorderRadius.circular(16.h),
                                            margin: EdgeInsets.only(left: 1.h)),
                                        SizedBox(height: 10.v),
                                        Padding(
                                            padding: EdgeInsets.only(left: 2.h),
                                            child: Text("lbl_set_b2".tr,
                                                style: CustomTextStyles
                                                    .titleLargeDMSansBluegray800)),
                                        SizedBox(height: 2.v),
                                        Divider(endIndent: 11.h),
                                        SizedBox(height: 13.v),
                                        Padding(
                                            padding: EdgeInsets.only(left: 3.h),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "lbl_created_on".tr,
                                                      style: CustomTextStyles
                                                          .titleMediumOnErrorContainerBold),
                                                  TextSpan(
                                                      text:
                                                          "lbl_sept_30_2023".tr,
                                                      style: CustomTextStyles
                                                          .titleMediumPurpleA700)
                                                ]),
                                                textAlign: TextAlign.left)),
                                        Padding(
                                            padding: EdgeInsets.only(left: 3.h),
                                            child: RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text:
                                                          "msg_contribution_started"
                                                              .tr,
                                                      style: CustomTextStyles
                                                          .titleMediumOnErrorContainerBold),
                                                  TextSpan(
                                                      text: "lbl_pending".tr,
                                                      style: CustomTextStyles
                                                          .titleMediumPurpleA700)
                                                ]),
                                                textAlign: TextAlign.left)),
                                        SizedBox(height: 8.v),
                                        Padding(
                                            padding: EdgeInsets.only(left: 8.h),
                                            child: Text("lbl_menu".tr,
                                                style: CustomTextStyles
                                                    .titleMediumBlack90002)),
                                        SizedBox(height: 10.v),
                                        _buildCartAppCardList(context),
                                        SizedBox(height: 24.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 16.h),
                                            child: Text("lbl_members".tr,
                                                textAlign: TextAlign.center,
                                                style: CustomTextStyles
                                                    .titleMediumBlack90002)),
                                        SizedBox(height: 7.v),
                                        _buildOverflowMenuStack1(context),
                                        SizedBox(height: 10.v),
                                        _buildOverflowMenuStack2(context),
                                        SizedBox(height: 10.v),
                                        _buildOverflowMenuStack3(context),
                                        SizedBox(height: 17.v),
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 23.h),
                                            child: Text(
                                                "msg_available_slots2".tr,
                                                textAlign: TextAlign.center,
                                                style: CustomTextStyles
                                                    .titleMediumBlack90002)),
                                        SizedBox(height: 17.v),
                                        _buildVectorColumn(context),
                                        SizedBox(height: 58.v)
                                      ]))),
                          _buildEpArrowRightBoldRow(context)
                        ])))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 63.v,
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgShare,
              margin: EdgeInsets.only(left: 25.h, top: 27.v, right: 11.h),
              onTap: () {
                onTapShare(context);
              }),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgDotVertical,
              margin: EdgeInsets.only(left: 16.h, top: 27.v, right: 36.h),
              onTap: () {
                onTapDotVertical(context);
              })
        ],
        styleType: Style.bgStyle);
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
              return Cartappcardlist2ItemWidget(onTapImgOverflowMenu: () {
                onTapImgOverflowMenu(context);
              });
            }));
  }

  /// Section Widget
  Widget _buildOverflowMenuStack1(BuildContext context) {
    return Container(
        height: 72.v,
        width: 330.h,
        margin: EdgeInsets.only(left: 6.h),
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 85.h, bottom: 17.v),
                  child: Text("lbl_february".tr,
                      style: CustomTextStyles.dMSansGray800))),
          CustomTextFormField(
              width: 330.h,
              controller: overflowmenuController,
              hintText: "lbl_julie_williams".tr,
              hintStyle: theme.textTheme.titleMedium!,
              alignment: Alignment.center,
              prefix: Container(
                  margin: EdgeInsets.fromLTRB(26.h, 13.v, 12.h, 14.v),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(22.h)),
                  child: CustomImageView(
                      imagePath: ImageConstant.imgEllipse5945x44,
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
              fillColor: appTheme.gray40033)
        ]));
  }

  /// Section Widget
  Widget _buildOverflowMenuStack2(BuildContext context) {
    return Container(
        height: 72.v,
        width: 330.h,
        margin: EdgeInsets.only(left: 6.h),
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 85.h, bottom: 17.v),
                  child: Text("lbl_november".tr,
                      style: CustomTextStyles.dMSansGray800))),
          CustomTextFormField(
              width: 330.h,
              controller: overflowmenuController1,
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
              fillColor: appTheme.gray40033)
        ]));
  }

  /// Section Widget
  Widget _buildOverflowMenuStack3(BuildContext context) {
    return Container(
        height: 72.v,
        width: 330.h,
        margin: EdgeInsets.only(left: 6.h),
        child: Stack(alignment: Alignment.center, children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 85.h, bottom: 15.v),
                  child: Text("lbl_may".tr,
                      style: CustomTextStyles.dMSansGray800))),
          CustomTextFormField(
              width: 330.h,
              controller: overflowmenuController2,
              hintText: "lbl_jason_wang".tr,
              hintStyle: theme.textTheme.titleMedium!,
              textInputAction: TextInputAction.done,
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
              fillColor: appTheme.gray40033)
        ]));
  }

  /// Section Widget
  Widget _buildVectorColumn(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onTapVectorColumn(context);
        },
        child: Container(
            margin: EdgeInsets.only(left: 6.h, right: 3.h),
            padding: EdgeInsets.symmetric(horizontal: 157.h, vertical: 11.v),
            decoration: AppDecoration.fillGray40033
                .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
            child: CustomImageView(
                imagePath: ImageConstant.imgVectorBlack90002,
                height: 14.adaptSize,
                width: 14.adaptSize)));
  }

  /// Section Widget
  Widget _buildEpArrowRightBoldRow(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding: EdgeInsets.only(top: 97.v, bottom: 1797.v),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgEpArrowRightBold,
                      height: 39.v,
                      width: 29.h,
                      onTap: () {
                        onTapImgEpArrowRightBold(context);
                      }),
                  CustomImageView(
                      imagePath: ImageConstant.imgEpArrowRightBoldBlack90002,
                      height: 39.v,
                      width: 29.h,
                      onTap: () {
                        onTapImgEpArrowRightBold1(context);
                      })
                ])));
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

  /// Navigates to the myPostsScreen when the action is triggered.
  onTapShare(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.myPostsScreen);
  }

  /// Navigates to the oderDeliveryManagemaentFourScreen when the action is triggered.
  onTapDotVertical(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.oderDeliveryManagemaentFourScreen);
  }

  /// Navigates to the addMemberScreen when the action is triggered.
  onTapVectorColumn(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.addMemberScreen);
  }

  /// Navigates to the setAOneScreen when the action is triggered.
  onTapImgEpArrowRightBold(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.setAOneScreen);
  }

  /// Navigates to the setCScreen when the action is triggered.
  onTapImgEpArrowRightBold1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.setCScreen);
  }
}
