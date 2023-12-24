import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/repository/user_repository.dart';
import 'package:wulap_application/services/user_model.dart';
import 'package:wulap_application/widgets/custom_checkbox_button.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';
import 'package:google_sign_in/google_sign_in.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordVisible = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool icbaselinecheckboxoutlineblank = false;

  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _handleRegister() async {
    if (!_isFormValid()) return;

    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      final user = UserModel(
        userName: userNameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Call the CreateUser function to add the user to Firestore
      await UserRepository.instance.createUser(user);

      await _sendEmailVerification(userCredential.user!);
    } catch (error) {
      _handleRegistrationError(error);
    }
  }

  Future<void> _sendEmailVerification(User user) async {
    try {
      // Send email verification
      await user.sendEmailVerification();
      _showSnackBar(
          'Verification email sent. Please check your email to complete registration.');

      // Reload the user to update the email verification status
      await user.reload();

      // Wait for the email verification status to change
      await for (User? updatedUser
          in FirebaseAuth.instance.authStateChanges()) {
        if (updatedUser != null) {
          print("Email is verified. Navigating to dashboard...");
          Navigator.pushReplacementNamed(
              context, AppRoutes.dashboardPaluwaganScreen);
          return;
        }
      }

      // If email is not verified, show a snackbar and offer resend option
      _showSnackBar('Please verify your email before proceeding.');
      _showResendSnackBar(user);
    } catch (error) {
      String errorMessage = _getErrorMessage(error);
      print("Error During Email Verification: $errorMessage");
      _showErrorDialog(errorMessage);
    }
  }

  void _showResendSnackBar(User user) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () async {
                await user.sendEmailVerification();
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: Text('Resend'),
            ),
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: Text('Dismiss'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRegistrationError(dynamic error) {
    String errorMessage = _getErrorMessage(error);
    print("Error During Registration: $errorMessage");
    _showErrorDialog(errorMessage);
  }

  Future<bool> handleGoogleSignIn() async {
    try {
      await _googleSignIn.signIn();

      // If sign-in is successful, return true
      Navigator.pushReplacementNamed(
          context, AppRoutes.dashboardPaluwaganScreen);
      return true;
    } catch (error) {
      print("Google Sign In Error: $error");

      // If sign-in fails, return false
      return false;
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  bool _isFormValid() {
    if (!_formKey.currentState!.validate()) {
      return false;
    }

    if (!icbaselinecheckboxoutlineblank) {
      _showSnackBar('Please agree to the terms and conditions.');
      return false;
    }

    return true;
  }

  String _getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'email-already-in-use':
          return "This email is already in use. Please use a different email.";
        case 'invalid-email':
          return "The provided email is invalid. Please enter a valid email.";
        case 'weak-password':
          return "The password is too weak. Please use a stronger password.";
        case 'email-not-verified':
          return "Please verify your email before proceeding.";
        case 'network-request-failed':
          return "There was a problem connecting to the network. Please check your internet connection.";
        default:
          return "An error occurred during registration. Please try again.";
      }
    }
    return "An unknown error occurred during registration.";
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Registration Error"),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
            padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 49.v),
            child: Column(
              children: [
                Text(
                  "msg_create_an_account".tr,
                  style: CustomTextStyles.titleMediumBluegray800Bold,
                ),
                SizedBox(height: 18.v),
                Text(
                  "Welcome to Wulap".tr,
                  style: CustomTextStyles.bodyLargeDMSansBluegray800_1,
                ),
                SizedBox(height: 60.v),
                _buildEmail(context),
                SizedBox(height: 28.v),
                _buildUserName(context),
                SizedBox(height: 28.v),
                _buildPassword(context),
                SizedBox(height: 33.v),
                _buildIcbaselinecheckboxoutlineblank(context),
                SizedBox(height: 31.v),
                _buildRegister(context),
                SizedBox(height: 25.v),
                _buildOrSignUpWithDivider(context),
                SizedBox(height: 26.v),
                _buildGoogleSignInButton(context),
                SizedBox(height: 26.v),
                _buildHaveAnAccountRichText(context),
                SizedBox(height: 5.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrSignUpWithDivider(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.v, bottom: 6.v),
            child: SizedBox(
              width: 92.h,
              child: Divider(color: appTheme.gray500),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 13.h),
            child: Text(
              "lbl_or_sign_up_with".tr,
              style: CustomTextStyles.bodyMediumOutfitOnPrimary,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.v, bottom: 6.v),
            child: SizedBox(
              width: 103.h,
              child: Divider(color: appTheme.gray500, indent: 14.h),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool success = await handleGoogleSignIn();
        if (success) {
          // Handle successful Google Sign-In
        }
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgGoogle,
            height: 20.v,
            width: 20.h,
            margin: EdgeInsets.symmetric(vertical: 1.v),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.h),
            child: Text(
              "Google".tr,
              style: CustomTextStyles.titleSmallPoppins,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHaveAnAccountRichText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapTxtHaveanaccount(context);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "msg_have_an_account2".tr,
              style: CustomTextStyles.bodyLargeDMSansBluegray800,
            ),
            TextSpan(text: " "),
            TextSpan(
              text: "lbl_log_in".tr,
              style: CustomTextStyles.titleMediumBlack90002Bold,
            ),
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "lbl_email_address".tr,
      hintStyle: CustomTextStyles.bodyMediumBluegray800_2,
      textInputType: TextInputType.emailAddress,
      textStyle: TextStyle(
        color: Color.fromARGB(
            255, 30, 30, 30), // Change the color to make it darker
      ),
    );
  }

  /// Section Widget
  Widget _buildUserName(BuildContext context) {
    return CustomTextFormField(
      controller: userNameController,
      hintText: "lbl_username".tr,
      hintStyle: CustomTextStyles.bodyMediumBluegray800_2,
      textStyle: TextStyle(
        color: Color.fromARGB(
            255, 30, 30, 30), // Change the color to make it darker
      ),
    );
  }

  /// Section Widget
  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "password".tr,
      hintStyle: CustomTextStyles.bodyMediumBluegray800_2,
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: !_isPasswordVisible,
      textStyle: TextStyle(
        color: Color.fromARGB(
            255, 30, 30, 30), // Change the color to make it darker
      ),
      suffix: GestureDetector(
        onTap: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(30.h, 14.v, 14.h, 14.v),
          child: CustomImageView(
            imagePath: _isPasswordVisible
                ? ImageConstant.imgAntdesigneyeoutlined
                : ImageConstant.imgAntdesigneyeinvisibleoutlined,
            height: 24.adaptSize,
            width: 24.adaptSize,
          ),
        ),
      ),
      suffixConstraints: BoxConstraints(maxHeight: 52.v),
      contentPadding: EdgeInsets.only(left: 16.h, top: 16.v, bottom: 16.v),
    );
  }

  /// Section Widget
  Widget _buildIcbaselinecheckboxoutlineblank(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 39.h, right: 40.h),
      child: CustomCheckboxButton(
        text: "msg_i_agree_with_the".tr,
        value: icbaselinecheckboxoutlineblank,
        onChange: (value) {
          setState(() {
            icbaselinecheckboxoutlineblank = value;
          });
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildRegister(BuildContext context) {
    return CustomElevatedButton(
      height: 52.v,
      text: "lbl_register".tr,
      margin: EdgeInsets.symmetric(horizontal: 31.h),
      buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
      onPressed: () {
        if (icbaselinecheckboxoutlineblank) {
          if (_formKey.currentState!.validate()) {
            _handleRegister();
          }
        } else {
          _showSnackBar('Please agree to the terms and conditions.');
        }
      },
    );
  }

  /// Navigates to the emailVerificationScreen when the action is triggered.
  onTapRegister(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registrationSuccessfulScreen);
  }

  /// Navigates to the logInScreen when the action is triggered.
  onTapTxtHaveanaccount(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.logInScreen);
  }
}
