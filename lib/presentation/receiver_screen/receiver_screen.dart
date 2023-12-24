import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_outlined_button.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ReceiverScreen extends StatelessWidget {
  ReceiverScreen({Key? key}) : super(key: key);

  TextEditingController group286Controller = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController addressController1 = TextEditingController();

  TextEditingController physicalAddressController = TextEditingController();

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
                      SizedBox(height: 4.v),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 23.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 14.h, vertical: 32.v),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder30),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 24.h),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomImageView(
                                              imagePath:
                                                  ImageConstant.imgArrowLeft,
                                              height: 13.v,
                                              width: 18.h,
                                              margin:
                                                  EdgeInsets.only(bottom: 83.v),
                                              onTap: () {
                                                onTapImgArrowLeft(context);
                                              }),
                                          CustomImageView(
                                              imagePath: ImageConstant
                                                  .imgEllipse4686x88,
                                              height: 86.v,
                                              width: 88.h,
                                              radius:
                                                  BorderRadius.circular(44.h),
                                              margin: EdgeInsets.only(
                                                  left: 72.h, top: 10.v))
                                        ]))),
                            SizedBox(height: 8.v),
                            Text("lbl_tony_herz".tr,
                                style: theme.textTheme.titleMedium),
                            SizedBox(height: 16.v),
                            SizedBox(
                                height: 52.v,
                                width: 311.h,
                                child: Stack(
                                    alignment: Alignment.topLeft,
                                    children: [
                                      Align(
                                          alignment: Alignment.bottomCenter,
                                          child: SizedBox(
                                              height: 45.v,
                                              width: 311.h,
                                              child: Stack(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  children: [
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgRectangle12,
                                                        height: 45.v,
                                                        width: 311.h,
                                                        radius: BorderRadius
                                                            .circular(4.h),
                                                        alignment:
                                                            Alignment.center),
                                                    Align(
                                                        alignment: Alignment
                                                            .centerLeft,
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 18.h),
                                                            child: Row(
                                                                children: [
                                                                  Padding(
                                                                      padding: EdgeInsets.only(
                                                                          bottom: 2
                                                                              .v),
                                                                      child: Text(
                                                                          "lbl_63"
                                                                              .tr,
                                                                          style:
                                                                              CustomTextStyles.bodyLargeDMSansBluegray800_1)),
                                                                  CustomImageView(
                                                                      imagePath:
                                                                          ImageConstant
                                                                              .imgArrowDown,
                                                                      height:
                                                                          20.v,
                                                                      width:
                                                                          21.h,
                                                                      margin: EdgeInsets.only(
                                                                          left: 1
                                                                              .h,
                                                                          top: 3
                                                                              .v)),
                                                                  Padding(
                                                                      padding: EdgeInsets.only(
                                                                          left: 13
                                                                              .h,
                                                                          bottom: 2
                                                                              .v),
                                                                      child: Text(
                                                                          "lbl_0909_022_2355"
                                                                              .tr,
                                                                          style:
                                                                              CustomTextStyles.bodyLargeDMSansBlack90002))
                                                                ])))
                                                  ]))),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 18.h),
                                              child: Text("lbl_mobile_no_1".tr,
                                                  style: CustomTextStyles
                                                      .bodySmallPurpleA70010)))
                                    ])),
                            SizedBox(height: 4.v),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 19.h, vertical: 12.v),
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(top: 7.v),
                                          child: Text("lbl_63".tr,
                                              style: CustomTextStyles
                                                  .bodyLargeDMSansBluegray800_1)),
                                      CustomImageView(
                                          imagePath: ImageConstant.imgArrowDown,
                                          height: 20.v,
                                          width: 21.h,
                                          margin: EdgeInsets.only(top: 7.v)),
                                      _buildGroup286(context)
                                    ])),
                            SizedBox(height: 13.v),
                            _buildEmail(context),
                            SizedBox(height: 13.v),
                            SizedBox(
                                height: 44.v,
                                width: 311.h,
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(left: 112.h),
                                              child: Text("lbl_tony_herz".tr,
                                                  style: CustomTextStyles
                                                      .bodyLargeDMSansBlack90002))),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                              width: 311.h,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 14.h,
                                                  vertical: 10.v),
                                              decoration: AppDecoration
                                                  .outlinePurpleA
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder6),
                                              child: Text("lbl_facebook2".tr,
                                                  style: CustomTextStyles
                                                      .bodyLargeDMSansBluegray800_1)))
                                    ])),
                            SizedBox(height: 12.v),
                            _buildAddress(context),
                            SizedBox(height: 13.v),
                            SizedBox(
                                height: 45.v,
                                width: 311.h,
                                child: Stack(
                                    alignment: Alignment.centerRight,
                                    children: [
                                      _buildAddress1(context),
                                      _buildPhysicalAddress(context)
                                    ])),
                            SizedBox(height: 14.v),
                            _buildReceiverThisMonth(context),
                            SizedBox(height: 30.v),
                            _buildRemove(context),
                            SizedBox(height: 21.v)
                          ])),
                      SizedBox(height: 45.v),
                      Container(
                          height: 30.v,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: appTheme.whiteA700,
                              borderRadius: BorderRadius.vertical(
                                  bottom: Radius.circular(30.h))))
                    ])))));
  }

  /// Section Widget
  Widget _buildGroup286(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 14.h, top: 7.v),
        child: CustomTextFormField(
            width: 113.h,
            controller: group286Controller,
            hintText: "lbl_0961_023_5948".tr));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        controller: emailController,
        hintText: "lbl_email3".tr,
        hintStyle: CustomTextStyles.bodyLargeDMSansBluegray800_1,
        textInputType: TextInputType.emailAddress,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 11.v));
  }

  /// Section Widget
  Widget _buildAddress(BuildContext context) {
    return CustomTextFormField(
        controller: addressController,
        hintText: "lbl_postal_address2".tr,
        hintStyle: CustomTextStyles.bodyLargeDMSansBluegray800_1,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 11.v));
  }

  /// Section Widget
  Widget _buildAddress1(BuildContext context) {
    return CustomTextFormField(
        width: 311.h,
        controller: addressController1,
        hintText: "msg_physical_address2".tr,
        hintStyle: CustomTextStyles.bodyLargeDMSansBluegray800_1,
        alignment: Alignment.center,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 12.v));
  }

  /// Section Widget
  Widget _buildPhysicalAddress(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 8.h),
        child: CustomTextFormField(
            width: 148.h,
            controller: physicalAddressController,
            hintText: "msg_25_generoso_davao2".tr,
            textInputAction: TextInputAction.done,
            alignment: Alignment.centerRight));
  }

  /// Section Widget
  Widget _buildReceiverThisMonth(BuildContext context) {
    return CustomOutlinedButton(
        text: "msg_receiver_this_month".tr,
        buttonStyle: CustomButtonStyles.outlinePurpleA,
        buttonTextStyle: CustomTextStyles.bodyLargeDMSansBlack90002);
  }

  /// Section Widget
  Widget _buildRemove(BuildContext context) {
    return CustomElevatedButton(
        width: 153.h,
        text: "lbl_remove".tr,
        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700);
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }
}
