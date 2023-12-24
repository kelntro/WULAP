import '../paid_or_not_screen/widgets/userprofile_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class PaidOrNotScreen extends StatelessWidget {
  PaidOrNotScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    child: SizedBox(
                        height: 821.v,
                        width: double.maxFinite,
                        child: Stack(alignment: Alignment.topCenter, children: [
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4.h),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 19.h, vertical: 41.v),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.h),
                                            child: Text("lbl_members".tr,
                                                style: CustomTextStyles
                                                    .titleLargeDMSansBlack90002)),
                                        Padding(
                                            padding: EdgeInsets.only(left: 7.h),
                                            child: Text("lbl_that_had_paid".tr,
                                                style: CustomTextStyles
                                                    .bodyLargeNunitoGray50001)),
                                        SizedBox(height: 14.v),
                                        _buildUserProfile(context),
                                        SizedBox(height: 2.v)
                                      ]))),
                          _buildArrowLeft(context)
                        ])))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 7.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 10.v);
            },
            itemCount: 9,
            itemBuilder: (context, index) {
              return UserprofileItemWidget();
            }));
  }

  /// Section Widget
  Widget _buildArrowLeft(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 15.v),
            decoration:
                BoxDecoration(borderRadius: BorderRadiusStyle.customBorderTL33),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 21.v),
                  CustomImageView(
                      imagePath: ImageConstant.imgArrowLeftBlack9000212x15,
                      height: 12.v,
                      width: 15.h,
                      onTap: () {
                        onTapImgArrowLeft(context);
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

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
