import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

// ignore_for_file: must_be_immutable
class ResetPassordScreen extends StatefulWidget {
  ResetPassordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPassordScreen> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.v),
            child: Column(
              children: [
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
                Text("lbl_forgot_password".tr,
                    style: CustomTextStyles.headlineLargeABeeZeeBluegray90001),
                SizedBox(height: 10.v),
                Container(
                    width: 348.h,
                    margin: EdgeInsets.symmetric(horizontal: 4.h),
                    child: Text("msg_no_worries_enter".tr,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: CustomTextStyles.bodyMediumABeeZeeBluegray700_1
                            .copyWith(height: 1.57))),
                SizedBox(height: 32.v),
                _buildResetPasswordForm(),
                SizedBox(height: 5.v),
                _buildVerifyAccountButton(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: isLoading ? _buildLoadingIndicator() : null,
      ),
    );
  }

  /// Section Widget
  Widget _buildResetPasswordForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("lbl_e_mail".tr,
            style: CustomTextStyles.bodyMediumABeeZeeBluegray90001_1),
        SizedBox(height: 8.v),
        CustomTextFormField(
          controller: emailController,
          hintText: "msg_enter_your_email".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.emailAddress,
          borderDecoration: TextFormFieldStyleHelper.outlinePurpleATL8,
          filled: true,
          fillColor: appTheme.whiteA700,
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildVerifyAccountButton() {
    return CustomElevatedButton(
      height: 52.v,
      text: "lbl_verify_account".tr,
      margin: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 48.v),
      buttonTextStyle: CustomTextStyles.bodyLargeABeeZeeWhiteA700_2,
      onPressed: isLoading ? null : () => onTapVerifyAccountButton(),
    );
  }

  Widget _buildLoadingIndicator() {
    return Container(
      height: 52.v,
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }

  /// Navigates back to the previous screen.
  onTapImgArrowLeft(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the resetPassordTwoScreen when the action is triggered.
  void onTapVerifyAccountButton() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        isLoading = true;
      });

      try {
        await FirebaseAuth.instance
            .sendPasswordResetEmail(email: emailController.text);
        // Simulate a delay for demonstration purposes
        await Future.delayed(Duration(seconds: 2));

        // Show success dialog
        _showSuccessDialog();
      } catch (error) {
        print("Error sending reset email: $error");

        setState(() {
          isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error sending reset email. Please try again."),
            duration: Duration(seconds: 3),
          ),
        );

        return; // Exit the function if there was an error
      }
    }
  }

  void _showSuccessDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success, // 'success' instead of 'SUCCES'
      animType: AnimType.bottomSlide, // 'bottomSlide' instead of 'BOTTOMSLIDE'
      title: 'Success!',
      desc: 'Password reset email sent successfully.',
      btnOkOnPress: () {
        Navigator.of(context).pop(); // Close the dialog
        // Navigate to success screen
        Navigator.pushNamed(context, AppRoutes.logInScreen);
      },
      btnOkText: 'OK',
    )..show();
  }
}
