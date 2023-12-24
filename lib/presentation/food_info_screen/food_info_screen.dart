import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class FoodInfoScreen extends StatelessWidget {
  FoodInfoScreen({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();

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
                      Container(
                          height: 48.v,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: appTheme.whiteA700,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(33.h)))),
                      Spacer(flex: 41),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 23.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.h, vertical: 35.v),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder30),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgArrowLeftBlueGray800,
                                    height: 14.v,
                                    width: 16.h,
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.only(left: 14.h),
                                    onTap: () {
                                      onTapImgArrowLeft(context);
                                    }),
                                SizedBox(height: 28.v),
                                CustomImageView(
                                    imagePath:
                                        ImageConstant.imgEllipse46100x106,
                                    height: 100.v,
                                    width: 106.h,
                                    radius: BorderRadius.circular(53.h)),
                                SizedBox(height: 17.v),
                                CustomTextFormField(
                                    controller: nameController,
                                    hintText: "lbl_name2".tr,
                                    hintStyle: CustomTextStyles
                                        .bodyLargeDMSansBluegray800_1,
                                    textInputAction: TextInputAction.done,
                                    suffix: Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            30.h, 18.v, 19.h, 7.v),
                                        child: Text("msg_buttered_chicken".tr,
                                            style: TextStyle(
                                                color: Color(0XFF3C3C3C),
                                                fontSize: 14.fSize,
                                                fontFamily: 'DM Sans',
                                                fontWeight: FontWeight.w400))),
                                    suffixConstraints:
                                        BoxConstraints(maxHeight: 45.v),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 14.h, vertical: 11.v)),
                                SizedBox(height: 12.v),
                                Padding(
                                    padding: EdgeInsets.only(right: 1.h),
                                    child: _buildComponentSeven(context)),
                                SizedBox(height: 17.v),
                                Padding(
                                    padding: EdgeInsets.only(right: 1.h),
                                    child: _buildComponentSeven(context)),
                                SizedBox(height: 67.v),
                                CustomElevatedButton(
                                    width: 153.h,
                                    text: "lbl_remove".tr,
                                    buttonTextStyle:
                                        CustomTextStyles.titleMediumWhiteA700,
                                    onPressed: () {
                                      onTapRemove(context);
                                    }),
                                SizedBox(height: 5.v)
                              ])),
                      Spacer(flex: 58),
                      Container(
                          height: 30.v,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: appTheme.whiteA700,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(30.h))))
                    ])))));
  }

  /// Common widget
  Widget _buildComponentSeven(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 13.h, vertical: 10.v),
        decoration: AppDecoration.outlinePurpleA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 1.v),
              child: Text("lbl_price2".tr,
                  style: CustomTextStyles.bodyLargeDMSansBluegray800_1)),
          Padding(
              padding: EdgeInsets.only(top: 1.v, right: 2.h),
              child: Text("lbl_300".tr,
                  style: CustomTextStyles.titleMediumDeeppurpleA700))
        ]));
  }

  /// Navigates to the setAScreen when the action is triggered.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.setAScreen);
  }

  /// Navigates to the setAScreen when the action is triggered.
  onTapRemove(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.setAScreen);
  }
}
