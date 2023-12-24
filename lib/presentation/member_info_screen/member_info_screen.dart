import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class MemberInfoScreen extends StatelessWidget {
  MemberInfoScreen({Key? key}) : super(key: key);

  TextEditingController group227Controller = TextEditingController();

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
                      SizedBox(
                          height: 769.v,
                          width: double.maxFinite,
                          child:
                              Stack(alignment: Alignment.topCenter, children: [
                            Align(
                                alignment: Alignment.center,
                                child: Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 23.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 16.h, vertical: 35.v),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder30),
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(height: 5.v),
                                          Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 22.h),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        CustomImageView(
                                                            imagePath:
                                                                ImageConstant
                                                                    .imgArrowLeft,
                                                            height: 16.v,
                                                            width: 18.h,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        72.v),
                                                            onTap: () {
                                                              onTapImgArrowLeft(
                                                                  context);
                                                            }),
                                                        CustomImageView(
                                                            imagePath:
                                                                ImageConstant
                                                                    .imgEllipse46,
                                                            height: 86.v,
                                                            width: 88.h,
                                                            radius: BorderRadius
                                                                .circular(44.h),
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 72.h))
                                                      ]))),
                                          SizedBox(height: 6.v),
                                          Text("lbl_liam_smith".tr,
                                              style:
                                                  theme.textTheme.titleMedium),
                                          SizedBox(height: 18.v),
                                          SizedBox(
                                              height: 52.v,
                                              width: 311.h,
                                              child: Stack(
                                                  alignment: Alignment.topLeft,
                                                  children: [
                                                    Align(
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: SizedBox(
                                                            height: 45.v,
                                                            width: 311.h,
                                                            child: Stack(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                children: [
                                                                  CustomImageView(
                                                                      imagePath:
                                                                          ImageConstant
                                                                              .imgRectangle12,
                                                                      height:
                                                                          45.v,
                                                                      width:
                                                                          311.h,
                                                                      radius: BorderRadius
                                                                          .circular(4
                                                                              .h),
                                                                      alignment:
                                                                          Alignment
                                                                              .center),
                                                                  Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .centerLeft,
                                                                      child: Padding(
                                                                          padding: EdgeInsets.only(left: 18.h),
                                                                          child: Row(children: [
                                                                            Padding(
                                                                                padding: EdgeInsets.only(bottom: 2.v),
                                                                                child: Text("lbl_63".tr, style: CustomTextStyles.bodyLargeDMSansBluegray800_1)),
                                                                            CustomImageView(
                                                                                imagePath: ImageConstant.imgArrowDown,
                                                                                height: 20.v,
                                                                                width: 21.h,
                                                                                margin: EdgeInsets.only(left: 1.h, top: 3.v)),
                                                                            Padding(
                                                                                padding: EdgeInsets.only(left: 13.h, bottom: 2.v),
                                                                                child: Text("lbl_0991_440_2574".tr, style: CustomTextStyles.bodyLargeDMSansBlack90002))
                                                                          ])))
                                                                ]))),
                                                    Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 18.h),
                                                            child: Text(
                                                                "lbl_mobile_no_1"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .bodySmallPurpleA70010)))
                                                  ])),
                                          SizedBox(height: 4.v),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 19.h,
                                                  vertical: 12.v),
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 7.v),
                                                        child: Text("lbl_63".tr,
                                                            style: CustomTextStyles
                                                                .bodyLargeDMSansBluegray800_1)),
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgArrowDown,
                                                        height: 20.v,
                                                        width: 21.h,
                                                        margin: EdgeInsets.only(
                                                            top: 7.v)),
                                                    _buildGroup227(context)
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
                                                        alignment: Alignment
                                                            .bottomCenter,
                                                        child: Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    bottom:
                                                                        10.v),
                                                            child: Text(
                                                                "lbl_liam_smith"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .bodyLargeDMSansBlack90002))),
                                                    Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                            width: 311.h,
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        14.h,
                                                                    vertical:
                                                                        10.v),
                                                            decoration: AppDecoration
                                                                .outlinePurpleA
                                                                .copyWith(
                                                                    borderRadius:
                                                                        BorderRadiusStyle
                                                                            .roundedBorder6),
                                                            child: Text(
                                                                "lbl_facebook2"
                                                                    .tr,
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
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  children: [
                                                    _buildAddress1(context),
                                                    _buildPhysicalAddress(
                                                        context)
                                                  ])),
                                          SizedBox(height: 13.v),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10.v),
                                              decoration: AppDecoration
                                                  .outlinePurpleA
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder6),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.v),
                                                        child: Text(
                                                            "msg_receiver_for_the2"
                                                                .tr,
                                                            style: CustomTextStyles
                                                                .bodyLargeDMSansBluegray800_1)),
                                                    Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 1.v),
                                                        child: Text(
                                                            "lbl_november".tr,
                                                            style: CustomTextStyles
                                                                .bodyLargeDMSansBlack90002))
                                                  ])),
                                          SizedBox(height: 37.v),
                                          _buildAssignedAsReceiver(context),
                                          SizedBox(height: 22.v),
                                          _buildRemove(context)
                                        ]))),
                            Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                    height: 48.v,
                                    width: double.maxFinite,
                                    decoration: BoxDecoration(
                                        color: appTheme.whiteA700,
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(33.h)))))
                          ])),
                      SizedBox(height: 22.v),
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
  Widget _buildGroup227(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 14.h, top: 7.v),
        child: CustomTextFormField(
            width: 113.h,
            controller: group227Controller,
            hintText: "lbl_0914_052_2555".tr));
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
        padding: EdgeInsets.only(right: 11.h, bottom: 9.v),
        child: CustomTextFormField(
            width: 144.h,
            controller: physicalAddressController,
            hintText: "msg_34_buhangin_davao".tr,
            textInputAction: TextInputAction.done,
            alignment: Alignment.bottomRight));
  }

  /// Section Widget
  Widget _buildAssignedAsReceiver(BuildContext context) {
    return CustomElevatedButton(
        width: 183.h,
        text: "msg_assigned_as_receiver".tr,
        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
        onPressed: () {
          onTapAssignedAsReceiver(context);
        });
  }

  /// Section Widget
  Widget _buildRemove(BuildContext context) {
    return CustomElevatedButton(
        width: 153.h,
        text: "lbl_remove".tr,
        buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
        onPressed: () {
          onTapRemove(context);
        });
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the setAScreen when the action is triggered.
  onTapAssignedAsReceiver(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.setAScreen);
  }

  /// Navigates to the setAScreen when the action is triggered.
  onTapRemove(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.setAScreen);
  }
}
