import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_title.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class SettingsthreeScreen extends StatelessWidget {
  SettingsthreeScreen({Key? key}) : super(key: key);

  TextEditingController newpasswordController = TextEditingController();

  TextEditingController newpasswordController1 = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(context),
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      Container(
                          height: 48.v,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: appTheme.whiteA700,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(33.h)))),
                      Spacer(flex: 50),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.h, vertical: 98.v),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder30),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                        width: 328.h,
                                        margin: EdgeInsets.only(right: 21.h),
                                        child: Text("msg_new_password_must".tr,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: CustomTextStyles
                                                .bodyMediumBluegray800_3
                                                .copyWith(height: 1.20)))),
                                SizedBox(height: 26.v),
                                CustomTextFormField(
                                    controller: newpasswordController,
                                    hintText: "msg_input_old_password".tr,
                                    hintStyle: CustomTextStyles
                                        .bodyLargeDMSansBluegray800_1,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    obscureText: true),
                                SizedBox(height: 12.v),
                                CustomTextFormField(
                                    controller: newpasswordController1,
                                    hintText: "lbl_new_password".tr,
                                    hintStyle: CustomTextStyles
                                        .bodyLargeDMSansBluegray800_1,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    obscureText: true),
                                SizedBox(height: 12.v),
                                CustomTextFormField(
                                    controller: confirmpasswordController,
                                    hintText: "msg_confirm_password".tr,
                                    hintStyle: CustomTextStyles
                                        .bodyLargeDMSansBluegray800_1,
                                    textInputAction: TextInputAction.done,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    obscureText: true)
                              ])),
                      Spacer(flex: 49)
                    ]))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        height: 96.v,
        leadingWidth: 40.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeftBlueGray80024x24,
            margin: EdgeInsets.only(left: 16.h, top: 1.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        centerTitle: true,
        title: AppbarTitle(text: "lbl_reset_password".tr));
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
