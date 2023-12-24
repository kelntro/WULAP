import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("msg_email_verification".tr,
                          style: CustomTextStyles.titleMediumBluegray800_1),
                      SizedBox(height: 27.v),
                      SizedBox(
                          width: 256.h,
                          child: Text("msg_we_ve_sent_an_email".tr,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.bodyMediumBluegray800_3
                                  .copyWith(height: 1.20))),
                      SizedBox(height: 6.v),
                      SizedBox(
                          width: 262.h,
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: "msg_if_you_don_t_see2".tr,
                                    style:
                                        CustomTextStyles.bodyMediumBluegray800),
                                TextSpan(text: " "),
                                TextSpan(
                                    text: "msg_of_these_thingscould".tr,
                                    style:
                                        CustomTextStyles.bodyMediumBluegray800)
                              ]),
                              textAlign: TextAlign.center)),
                      SizedBox(height: 96.v),
                      CustomElevatedButton(
                          height: 45.v,
                          width: 254.h,
                          text: "lbl_continue".tr,
                          buttonTextStyle: CustomTextStyles.titleSmallWhiteA700,
                          onPressed: () {
                            onTapContinue(context);
                          }),
                      SizedBox(height: 5.v)
                    ]))));
  }

  /// Navigates to the registrationSuccessfulScreen when the action is triggered.
  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registrationSuccessfulScreen);
  }
}
