import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ResetPassordOneScreen extends StatelessWidget {
  ResetPassordOneScreen({Key? key}) : super(key: key);

  TextEditingController fourDigitCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.v),
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
                  SizedBox(height: 60.v),
                  Text("lbl_verify_account".tr,
                      style:
                          CustomTextStyles.headlineLargeABeeZeeBluegray90001),
                  SizedBox(height: 12.v),
                  RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "msg_code_has_been_send2".tr,
                            style:
                                CustomTextStyles.bodyMediumABeeZeeBluegray700),
                        TextSpan(
                            text: "msg_johndoe_gmail_com".tr,
                            style: CustomTextStyles
                                .bodyMediumABeeZeeBluegray90001),
                        TextSpan(
                            text: "lbl".tr,
                            style:
                                CustomTextStyles.bodyMediumABeeZeeBluegray700)
                      ]),
                      textAlign: TextAlign.left),
                  SizedBox(height: 4.v),
                  Text("msg_enter_the_code_to".tr,
                      style: CustomTextStyles.bodyMediumABeeZeeBluegray700_1),
                  SizedBox(height: 35.v),
                  _buildTextFieldSection(context),
                  Spacer(flex: 56),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text("msg_didn_t_receive_code".tr,
                            style: CustomTextStyles
                                .bodyMediumABeeZeeBluegray700_1)),
                    Padding(
                        padding: EdgeInsets.only(left: 8.h),
                        child: Text("lbl_resend_code".tr,
                            style: CustomTextStyles.bodyMediumABeeZeeIndigo100
                                .copyWith(
                                    decoration: TextDecoration.underline)))
                  ]),
                  SizedBox(height: 12.v),
                  Text("msg_resend_code_in_00_59".tr,
                      style: CustomTextStyles.bodyMediumABeeZeeBluegray700_1),
                  Spacer(flex: 43)
                ])),
            bottomNavigationBar: _buildVerifyAccountButtonSection(context)));
  }

  /// Section Widget
  Widget _buildTextFieldSection(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_enter_code".tr,
          style: CustomTextStyles.bodyMediumABeeZeeBluegray90001_1),
      SizedBox(height: 8.v),
      CustomTextFormField(
          controller: fourDigitCodeController,
          hintText: "lbl_4_digit_code".tr,
          textInputAction: TextInputAction.done,
          borderDecoration: TextFormFieldStyleHelper.outlinePurpleATL8,
          filled: true,
          fillColor: appTheme.whiteA700)
    ]);
  }

  /// Section Widget
  Widget _buildVerifyAccountButtonSection(BuildContext context) {
    return CustomElevatedButton(
        height: 52.v,
        text: "lbl_verify_account".tr,
        margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 48.v),
        buttonTextStyle: CustomTextStyles.bodyLargeABeeZeeWhiteA700_2,
        onPressed: () {
          onTapVerifyAccountButtonSection(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the resetPassordTwoScreen when the action is triggered.
  onTapVerifyAccountButtonSection(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.resetPassordTwoScreen);
  }
}
