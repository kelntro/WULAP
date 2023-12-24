import '../late_payment_reminder_screen/widgets/barline_item_widget.dart';
import '../late_payment_reminder_screen/widgets/datagraphresult_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_title.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';

// ignore_for_file: must_be_immutable
class LatePaymentReminderScreen extends StatelessWidget {
  LatePaymentReminderScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 21.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDataMobileGraph(context),
                      SizedBox(height: 30.v),
                      Text("lbl_interest".tr,
                          style: CustomTextStyles.headlineSmallInterBlack90002),
                      SizedBox(height: 30.v),
                      _buildDataGraphResult(context)
                    ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 48.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlack90002,
            margin: EdgeInsets.only(left: 24.h, top: 15.v, bottom: 16.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "msg_deadline_of_payments".tr));
  }

  /// Section Widget
  Widget _buildDataMobileGraph(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 15.h),
        padding: EdgeInsets.symmetric(horizontal: 18.h, vertical: 15.v),
        decoration: AppDecoration.outlineGray20001
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder20),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          SizedBox(height: 9.v),
          SizedBox(
              height: 190.v,
              child: ListView.separated(
                  padding: EdgeInsets.only(right: 3.h),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) {
                    return SizedBox(width: 19.h);
                  },
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return BarlineItemWidget();
                  }))
        ]));
  }

  /// Section Widget
  Widget _buildDataGraphResult(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 15.h),
        child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (context, index) {
              return SizedBox(height: 14.v);
            },
            itemCount: 6,
            itemBuilder: (context, index) {
              return DatagraphresultItemWidget();
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

  /// Navigates back to the previous screen.
  onTapArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
