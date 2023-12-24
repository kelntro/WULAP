import '../buytwo_screen/widgets/cafebrichorslist_item_widget.dart';
import '../buytwo_screen/widgets/cookiesandwichlist_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:wulap_application/widgets/app_bar/appbar_title_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_trailing_image.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class BuytwoScreen extends StatelessWidget {
  BuytwoScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 8.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(left: 28.h, right: 25.h),
                              child: Column(children: [
                                Text("lbl_your_orders".tr,
                                    style: CustomTextStyles
                                        .bodyLargeABeeZeeBlack900_2),
                                SizedBox(height: 11.v),
                                Padding(
                                    padding: EdgeInsets.only(right: 2.h),
                                    child: _buildText(context,
                                        upcomingOrdersText:
                                            "lbl_upcoming_orders".tr,
                                        clearAllText: "lbl_clear_all".tr)),
                                SizedBox(height: 23.v),
                                _buildCookieSandwichList(context),
                                SizedBox(height: 16.v),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Container(
                                        height: 35.v,
                                        width: 158.h,
                                        margin: EdgeInsets.only(right: 2.h),
                                        child: Stack(
                                            alignment: Alignment.topCenter,
                                            children: [
                                              Align(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  child: GestureDetector(
                                                      onTap: () {
                                                        onTapView(context);
                                                      },
                                                      child: Container(
                                                          height: 30.v,
                                                          width: 158.h,
                                                          decoration: BoxDecoration(
                                                              color: theme
                                                                  .colorScheme
                                                                  .primary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          6.h))))),
                                              Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Text(
                                                      "lbl_proceed_payment".tr,
                                                      style: CustomTextStyles
                                                          .bodyLargeABeeZeeWhiteA700_1))
                                            ]))),
                                SizedBox(height: 28.v),
                                Padding(
                                    padding: EdgeInsets.only(left: 3.h),
                                    child: _buildText(context,
                                        upcomingOrdersText:
                                            "lbl_past_orders".tr,
                                        clearAllText: "lbl_clear_all".tr)),
                                SizedBox(height: 23.v),
                                _buildCafeBrichorsList(context)
                              ]))))
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 77.v,
        title: Padding(
            padding: EdgeInsets.only(left: 20.h),
            child: Column(children: [
              AppbarTitleImage(
                  imagePath: ImageConstant.imgArrowLeftBlack9000212x15,
                  margin: EdgeInsets.only(right: 118.h),
                  onTap: () {
                    onTapArrowLeft(context);
                  }),
              SizedBox(height: 21.v),
              Row(children: [
                AppbarTitleImage(imagePath: ImageConstant.imgProfile34x34),
                AppbarSubtitle(
                    text: "lbl_hi_mitch_doe".tr,
                    margin: EdgeInsets.only(left: 14.h, top: 6.v, bottom: 8.v))
              ])
            ])),
        actions: [
          Padding(
              padding: EdgeInsets.fromLTRB(25.h, 34.v, 25.h, 11.v),
              child: Column(children: [
                SizedBox(
                    height: 19.adaptSize,
                    width: 19.adaptSize,
                    child: Stack(alignment: Alignment.topRight, children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgVectorPrimary,
                          height: 19.adaptSize,
                          width: 19.adaptSize,
                          alignment: Alignment.center),
                      Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                              onTap: () {
                                onTapVector(context);
                              },
                              child: Container(
                                  height: 6.adaptSize,
                                  width: 6.adaptSize,
                                  margin: EdgeInsets.only(
                                      left: 12.h, top: 1.v, bottom: 11.v),
                                  decoration: BoxDecoration(
                                      color: appTheme.redA700,
                                      borderRadius:
                                          BorderRadius.circular(3.h)))))
                    ])),
                SizedBox(height: 1.v),
                AppbarTrailingImage(
                    imagePath: ImageConstant.imgVectorPrimary1x3,
                    margin: EdgeInsets.only(left: 8.h, right: 7.h),
                    onTap: () {
                      onTapVector1(context);
                    })
              ]))
        ]);
  }

  /// Section Widget
  Widget _buildCookieSandwichList(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 5.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 16.v);
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return CookiesandwichlistItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildCafeBrichorsList(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 3.h, right: 2.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 20.v);
            },
            itemCount: 3,
            itemBuilder: (context, index) {
              return CafebrichorslistItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(navigatorKey.currentContext!, getCurrentRoute(type));
    });
  }

  /// Common widget
  Widget _buildText(
    BuildContext context, {
    required String upcomingOrdersText,
    required String clearAllText,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(upcomingOrdersText,
          style: CustomTextStyles.bodyLargeABeeZeeBluegray40002_1
              .copyWith(color: appTheme.blueGray40002)),
      Padding(
          padding: EdgeInsets.only(top: 2.v),
          child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "lbl_clear_al".tr.toUpperCase(),
                    style: CustomTextStyles.bodySmallABeeZeeBlack90002_2),
                TextSpan(
                    text: "lbl_l".tr.toUpperCase(),
                    style: CustomTextStyles.bodySmallABeeZeeBlack90002_1)
              ]),
              textAlign: TextAlign.left))
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
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the notificationsScreen when the action is triggered.
  onTapVector(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
  }

  /// Navigates to the notificationsScreen when the action is triggered.
  onTapVector1(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
  }

  /// Navigates to the buythreeScreen when the action is triggered.
  onTapView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.buythreeScreen);
  }
}
