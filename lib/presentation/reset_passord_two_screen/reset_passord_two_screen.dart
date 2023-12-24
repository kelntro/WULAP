import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ResetPassordTwoScreen extends StatelessWidget {
  ResetPassordTwoScreen({Key? key}) : super(key: key);

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.v),
                    child: Column(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgArrowLeftBlack9000212x15,
                          height: 12.v,
                          width: 15.h,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 12.h),
                          onTap: () {
                            onTapImgArrowLeft(context);
                          }),
                      SizedBox(height: 57.v),
                      Text("msg_create_new_password".tr,
                          style: CustomTextStyles
                              .headlineLargeABeeZeeBluegray90001),
                      SizedBox(height: 15.v),
                      Text("msg_please_enter_and".tr,
                          style:
                              CustomTextStyles.bodyMediumABeeZeeBluegray700_1),
                      SizedBox(height: 5.v),
                      Text("msg_you_will_need_to".tr,
                          style:
                              CustomTextStyles.bodyMediumABeeZeeBluegray700_1),
                      SizedBox(height: 35.v),
                      _buildPasswordSection(context),
                      SizedBox(height: 16.v),
                      _buildConfirmPasswordSection(context),
                      SizedBox(height: 5.v)
                    ]))),
            bottomNavigationBar: _buildResetPasswordButtonSection(context)));
  }

  /// Section Widget
  Widget _buildPasswordSection(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_password2".tr,
          style: CustomTextStyles.bodyMediumABeeZeeBluegray90001_1),
      SizedBox(height: 8.v),
      CustomTextFormField(
          controller: passwordController,
          hintText: "lbl2".tr,
          textInputType: TextInputType.visiblePassword,
          suffix: Container(
              margin: EdgeInsets.fromLTRB(30.h, 13.v, 16.h, 13.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgFieyeoff,
                  height: 20.adaptSize,
                  width: 20.adaptSize)),
          suffixConstraints: BoxConstraints(maxHeight: 46.v),
          obscureText: true,
          contentPadding: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 14.v),
          borderDecoration: TextFormFieldStyleHelper.outlinePurpleATL8,
          filled: true,
          fillColor: appTheme.whiteA700),
      SizedBox(height: 8.v),
      Padding(
          padding: EdgeInsets.only(left: 8.h),
          child: Text("msg_must_contain_8_char".tr,
              style: CustomTextStyles.bodyMediumABeeZeeBluegray500))
    ]);
  }

  /// Section Widget
  Widget _buildConfirmPasswordSection(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("msg_confirm_password".tr,
          style: CustomTextStyles.bodyMediumABeeZeeBluegray90001_1),
      SizedBox(height: 8.v),
      CustomTextFormField(
          controller: confirmpasswordController,
          hintText: "lbl2".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          suffix: Container(
              margin: EdgeInsets.fromLTRB(30.h, 13.v, 16.h, 13.v),
              child: CustomImageView(
                  imagePath: ImageConstant.imgFieyeoff,
                  height: 20.adaptSize,
                  width: 20.adaptSize)),
          suffixConstraints: BoxConstraints(maxHeight: 46.v),
          obscureText: true,
          contentPadding: EdgeInsets.only(left: 16.h, top: 14.v, bottom: 14.v),
          borderDecoration: TextFormFieldStyleHelper.outlinePurpleATL8,
          filled: true,
          fillColor: appTheme.whiteA700)
    ]);
  }

  /// Section Widget
  Widget _buildResetPasswordButtonSection(BuildContext context) {
    return CustomElevatedButton(
        height: 52.v,
        text: "lbl_reset_password".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 48.v),
        buttonTextStyle: CustomTextStyles.bodyLargeABeeZeeWhiteA700_2,
        onPressed: () {
          onTapResetPasswordButtonSection(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the successfulScreen when the action is triggered.
  onTapResetPasswordButtonSection(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.successfulScreen);
  }
}
