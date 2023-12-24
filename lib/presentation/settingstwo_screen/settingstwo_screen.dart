import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SettingstwoScreen extends StatelessWidget {
  SettingstwoScreen({Key? key}) : super(key: key);

  TextEditingController inputNewPinController = TextEditingController();

  TextEditingController confirmPinController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                  SizedBox(height: 22.v),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 16.h),
                          child: Row(children: [
                            CustomImageView(
                                imagePath:
                                    ImageConstant.imgArrowLeftBlueGray80024x24,
                                height: 24.adaptSize,
                                width: 24.adaptSize,
                                margin: EdgeInsets.only(top: 1.v),
                                onTap: () {
                                  onTapImgArrowLeft(context);
                                }),
                            Padding(
                                padding:
                                    EdgeInsets.only(left: 95.h, bottom: 4.v),
                                child: Text("lbl_transaction_pin".tr,
                                    style: CustomTextStyles
                                        .titleMediumBluegray800))
                          ]))),
                  Spacer(flex: 44),
                  _buildSettings(context),
                  Spacer(flex: 55)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildSettings(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 57.v),
        decoration:
            BoxDecoration(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          SizedBox(height: 36.v),
          CustomTextFormField(
              controller: inputNewPinController,
              hintText: "lbl_input_new_pin".tr,
              hintStyle: CustomTextStyles.bodyLargeDMSansBluegray800_1),
          SizedBox(height: 12.v),
          CustomTextFormField(
              controller: confirmPinController,
              hintText: "lbl_confirm_pin".tr,
              hintStyle: CustomTextStyles.bodyLargeDMSansBluegray800_1,
              textInputAction: TextInputAction.done)
        ]));
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
