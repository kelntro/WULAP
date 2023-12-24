import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class EditNameScreen extends StatelessWidget {
  EditNameScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: SizedBox(
                    width: double.maxFinite,
                    child: Column(children: [
                      _buildArrowLeftSection(context),
                      Spacer(flex: 50),
                      _buildEditNameSection(context),
                      Spacer(flex: 49)
                    ]))),
            bottomNavigationBar: _buildBottomBarSection(context)));
  }

  /// Section Widget
  Widget _buildArrowLeftSection(BuildContext context) {
    return Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 28.h, vertical: 12.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.customBorderTL33),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 12.v),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowLeftBlack9000212x15,
                  height: 12.v,
                  width: 15.h,
                  onTap: () {
                    onTapImgArrowLeft(context);
                  })
            ]));
  }

  /// Section Widget
  Widget _buildEditNameSection(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 23.h),
        padding: EdgeInsets.symmetric(horizontal: 34.h, vertical: 30.v),
        decoration: AppDecoration.fillWhiteA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder30),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 6.v),
              Padding(
                  padding: EdgeInsets.only(left: 11.h),
                  child: Text("lbl_rename_category".tr,
                      style: CustomTextStyles.titleMediumBluegray800_1)),
              SizedBox(height: 17.v),
              Padding(
                  padding: EdgeInsets.only(left: 11.h, right: 1.h),
                  child: CustomTextFormField(
                      controller: nameController,
                      hintText: "lbl_name".tr,
                      hintStyle: CustomTextStyles.titleMediumNunitoGray50002,
                      textInputAction: TextInputAction.done,
                      borderDecoration:
                          TextFormFieldStyleHelper.underLineGray)),
              SizedBox(height: 48.v),
              Align(
                  alignment: Alignment.centerRight,
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    GestureDetector(
                        onTap: () {
                          onTapTxtCancel(context);
                        },
                        child: Text("lbl_cancel".tr,
                            style: CustomTextStyles.titleMediumPurpleA700_1)),
                    GestureDetector(
                        onTap: () {
                          onTapTxtRename(context);
                        },
                        child: Padding(
                            padding: EdgeInsets.only(left: 30.h),
                            child: Text("lbl_rename".tr,
                                style:
                                    CustomTextStyles.bodyLargeDMSansGray50002)))
                  ]))
            ]));
  }

  /// Section Widget
  Widget _buildBottomBarSection(BuildContext context) {
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

  /// Navigates to the dashboardoneScreen when the action is triggered.
  onTapTxtCancel(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.dashboardoneScreen);
  }

  /// Navigates to the dashboardoneScreen when the action is triggered.
  onTapTxtRename(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.dashboardoneScreen);
  }
}
