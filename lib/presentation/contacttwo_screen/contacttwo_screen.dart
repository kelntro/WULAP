import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/buy_page/buy_page.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class ContacttwoScreen extends StatelessWidget {
  ContacttwoScreen({Key? key}) : super(key: key);

  TextEditingController group339Controller = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController addressController1 = TextEditingController();

  TextEditingController group341Controller = TextEditingController();

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
                      Container(
                          height: 48.v,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              color: appTheme.whiteA700,
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(33.h)))),
                      SizedBox(height: 5.v),
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.h, vertical: 22.v),
                          decoration: AppDecoration.fillWhiteA.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder30),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            SizedBox(height: 13.v),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Row(children: [
                                  CustomImageView(
                                      imagePath: ImageConstant
                                          .imgArrowLeftBlueGray80024x24,
                                      height: 24.adaptSize,
                                      width: 24.adaptSize,
                                      onTap: () {
                                        onTapImgArrowLeft(context);
                                      }),
                                  Padding(
                                      padding: EdgeInsets.only(left: 113.h),
                                      child: Text("lbl_mitch_doe".tr,
                                          style: CustomTextStyles
                                              .bodyLargeDMSansBluegray800_1))
                                ])),
                            SizedBox(height: 32.v),
                            CustomImageView(
                                imagePath: ImageConstant.imgEllipse5964x68,
                                height: 64.v,
                                width: 68.h,
                                radius: BorderRadius.circular(34.h)),
                            SizedBox(height: 25.v),
                            _buildComponentTwo(context),
                            SizedBox(height: 8.v),
                            _buildGroup340(context),
                            SizedBox(height: 12.v),
                            _buildEmail(context),
                            SizedBox(height: 12.v),
                            _buildComponentEleven(context),
                            SizedBox(height: 13.v),
                            _buildAddress(context),
                            SizedBox(height: 12.v),
                            _buildAddress2(context)
                          ]))
                    ]))),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  Widget _buildComponentTwo(BuildContext context) {
    return SizedBox(
        height: 60.v,
        width: 350.h,
        child: Stack(alignment: Alignment.topLeft, children: [
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: 350.h,
                  margin: EdgeInsets.only(top: 8.v),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadiusStyle.roundedBorder6,
                      image: DecorationImage(
                          image: fs.Svg(ImageConstant.imgRectangle12),
                          fit: BoxFit.cover)),
                  child: Row(children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 1.v),
                        child: Text("lbl_63".tr,
                            style:
                                CustomTextStyles.bodyLargeDMSansBluegray800_1)),
                    CustomImageView(
                        imagePath: ImageConstant.imgArrowDown,
                        height: 24.adaptSize,
                        width: 24.adaptSize,
                        margin: EdgeInsets.only(left: 9.h)),
                    Padding(
                        padding: EdgeInsets.only(left: 25.h, bottom: 1.v),
                        child: Text("lbl_09914402929".tr,
                            style: CustomTextStyles.bodyLargeDMSansBlack90002))
                  ]))),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 21.h),
                  child: Text("lbl_mobile_no_1".tr,
                      style: CustomTextStyles.bodySmallPurpleA700)))
        ]));
  }

  /// Section Widget
  Widget _buildGroup339(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 25.h, top: 8.v, bottom: 4.v),
        child: CustomTextFormField(
            width: 108.h,
            controller: group339Controller,
            hintText: "lbl_09934705929".tr,
            textInputType: TextInputType.phone));
  }

  /// Section Widget
  Widget _buildGroup340(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 14.v),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: EdgeInsets.only(top: 11.v, bottom: 1.v),
                  child: Text("lbl_63".tr,
                      style: CustomTextStyles.bodyLargeDMSansBluegray800_1)),
              CustomImageView(
                  imagePath: ImageConstant.imgArrowDown,
                  height: 24.adaptSize,
                  width: 24.adaptSize,
                  margin: EdgeInsets.only(left: 9.h, top: 9.v)),
              _buildGroup339(context)
            ]));
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
        controller: emailController,
        hintText: "lbl_email2".tr,
        hintStyle: CustomTextStyles.bodyLargeDMSansBluegray800_1,
        textInputType: TextInputType.emailAddress);
  }

  /// Section Widget
  Widget _buildComponentEleven(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 14.v),
        decoration: AppDecoration.outlinePurpleA
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
        child: Row(children: [
          Padding(
              padding: EdgeInsets.only(bottom: 1.v),
              child: Text("lbl_facebook".tr,
                  style: CustomTextStyles.bodyLargeDMSansBluegray800_1)),
          Padding(
              padding: EdgeInsets.only(left: 38.h),
              child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "lbl_l2".tr,
                        style: CustomTextStyles.bodyLargeDMSansBlack90002_1),
                    TextSpan(
                        text: "lbl_iam_smith".tr,
                        style: CustomTextStyles.bodyLargeDMSansBlack90002_1)
                  ]),
                  textAlign: TextAlign.left))
        ]));
  }

  /// Section Widget
  Widget _buildAddress(BuildContext context) {
    return CustomTextFormField(
        controller: addressController,
        hintText: "lbl_postal_address".tr,
        hintStyle: CustomTextStyles.bodyLargeDMSansBluegray800_1);
  }

  /// Section Widget
  Widget _buildAddress1(BuildContext context) {
    return CustomTextFormField(
        width: 350.h,
        controller: addressController1,
        hintText: "msg_physical_address".tr,
        hintStyle: CustomTextStyles.bodyLargeDMSansBluegray800_1,
        alignment: Alignment.center);
  }

  /// Section Widget
  Widget _buildGroup341(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 7.h),
        child: CustomTextFormField(
            width: 189.h,
            controller: group341Controller,
            hintText: "msg_p_2_brgy_tacunan".tr,
            textInputAction: TextInputAction.done,
            alignment: Alignment.centerRight));
  }

  /// Section Widget
  Widget _buildAddress2(BuildContext context) {
    return SizedBox(
        height: 52.v,
        width: 350.h,
        child: Stack(
            alignment: Alignment.centerRight,
            children: [_buildAddress1(context), _buildGroup341(context)]));
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
