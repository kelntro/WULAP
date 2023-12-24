import '../buyone_screen/widgets/foodgrid_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:wulap_application/widgets/app_bar/appbar_title_image.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class BuyoneScreen extends StatelessWidget {
  BuyoneScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(children: [
                  SizedBox(height: 20.v),
                  Expanded(
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.only(left: 26.h, right: 29.h),
                              child: Column(children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 17.h, right: 15.h),
                                    child: CustomSearchView(
                                        controller: searchController,
                                        hintText: "lbl_search".tr)),
                                SizedBox(height: 21.v),
                                _buildFoodGrid(context)
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
                          alignment: Alignment.center,
                          onTap: () {
                            onTapImgVector(context);
                          }),
                      Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              height: 6.adaptSize,
                              width: 6.adaptSize,
                              margin: EdgeInsets.only(
                                  left: 12.h, top: 1.v, bottom: 11.v),
                              decoration: BoxDecoration(
                                  color: appTheme.redA700,
                                  borderRadius: BorderRadius.circular(3.h))))
                    ])),
              ]))
        ]);
  }

  /// Section Widget
  Widget _buildFoodGrid(BuildContext context) {
    return StaggeredGridView.countBuilder(
        shrinkWrap: true,
        primary: false,
        crossAxisCount: 4,
        crossAxisSpacing: 15.h,
        mainAxisSpacing: 15.h,
        staggeredTileBuilder: (index) {
          return StaggeredTile.fit(2);
        },
        itemCount: 6,
        itemBuilder: (context, index) {
          return FoodgridItemWidget(onTapFoodGrid: () {
            onTapFoodGrid(context);
          });
        });
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

  /// Navigates to the buytwoScreen when the action is triggered.
  onTapFoodGrid(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.buytwoScreen);
  }

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the notificationsScreen when the action is triggered.
  onTapImgVector(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
  }

  /// Navigates to the notificationsScreen when the action is triggered.
  onTapVector(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.notificationsScreen);
  }
}
