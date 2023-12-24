import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/data/user_data_provider.dart';
import 'package:wulap_application/presentation/log_in_screen/log_in_screen.dart';
import 'package:wulap_application/presentation/settings_screen/ChangePasswordScreen.dart';
import 'package:wulap_application/presentation/settings_screen/aboutUs.dart';
import 'package:wulap_application/presentation/settings_screen/faq.dart';
import 'package:wulap_application/presentation/settings_screen/privacyAndPolicy.dart';
import 'package:wulap_application/presentation/settings_screen/profileInformationScreen.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  static const String userLoggedInKey = 'userLoggedIn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        automaticallyImplyLeading: false, // This will remove the back arrow
      ),
      body: _buildSettingsBody(),
      bottomNavigationBar: _buildBottomBarSection(),
    );
  }

  Widget _buildSettingsBody() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.v),
              _buildProfileSection(),
              SizedBox(height: 25.v),
              _buildSecuritySection(),
              SizedBox(height: 25.v),
              _buildHelpSection(),
              SizedBox(height: 120.v),
              _buildLogoutButton(),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: Text(
            "lbl_edit_profile".tr,
            style: CustomTextStyles.bodyMediumBluegray800_3.copyWith(
              fontSize: 18.0, // Adjust the font size as needed
            ),
          ),
        ),
        SizedBox(height: 3.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: _buildProfileInfo(),
        ),
      ],
    );
  }

  Widget _buildProfileInfo() {
    return GestureDetector(
      onTap: () async {
        // Get the current user from Firebase Authentication
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {
          String userId = user.uid;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileInformationScreen(userId: userId),
            ),
          );
        } else {
          // Handle the case where the user is not authenticated
          print('Error: User is not authenticated');
        }
      },
      child: Padding(
        padding: EdgeInsets.only(top: 14.0), // Adjust the top padding as needed
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 11.v),
          decoration: AppDecoration.fillPurpleA7003
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.h, right: 9.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Padding(
                        padding: EdgeInsets.only(top: 1.v),
                        child: Text(
                          "Profile Information",
                          style: CustomTextStyles.bodySmallBluegray800.copyWith(
                            color: Color.fromARGB(255, 57, 57, 57),
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowRightBlueGray8001,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSecuritySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: Text(
            "lbl_security".tr,
            style: CustomTextStyles.bodyMediumBluegray800_3.copyWith(
              fontSize: 18.0, // Adjust the font size as needed
            ),
          ),
        ),
        SizedBox(height: 2.v),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: _buildSecurityInfo(),
        ),
      ],
    );
  }

  Widget _buildSecurityInfo() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangePasswordScreen()),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 14.0), // Adjust the top padding as needed
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 11.v),
          decoration: AppDecoration.fillPurpleA7003
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.h, right: 9.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Padding(
                        padding: EdgeInsets.only(top: 1.v),
                        child: Text(
                          "Change Password",
                          style: CustomTextStyles.bodySmallBluegray800.copyWith(
                            color: Color.fromARGB(255, 57, 57, 57),
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowRightBlueGray8001,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHelpSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.h),
          child: Text(
            "lbl_help".tr,
            style: CustomTextStyles.bodyMediumBluegray800_3.copyWith(
              fontSize: 18.0, // Adjust the font size as needed
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.h),
          child: _buildFaq(
            context,
            faq: "lbl_faq".tr,
            privacyPolicy: "lbl_privacy_policy".tr,
            aboutUs: "lbl_about_us".tr,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  Widget _buildFaq(
    BuildContext context, {
    required String faq,
    required String privacyPolicy,
    required String aboutUs,
    required double fontSize,
  }) {
    _navigateToScreen(Widget screen) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 6.0), // Adjust the top padding as needed
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildListItem(faq, () => _navigateToScreen(FAQScreen())),
          _buildListItem(
              privacyPolicy, () => _navigateToScreen(PrivacyPolicyScreen())),
          _buildListItem(aboutUs, () => _navigateToScreen(AboutUsScreen())),
        ],
      ),
    );
  }

  Widget _buildListItem(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: 11.0), // Adjust the vertical padding
          decoration: AppDecoration.fillPurpleA7003
              .copyWith(borderRadius: BorderRadiusStyle.roundedBorder6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.h, right: 9.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Opacity(
                      opacity: 0.8,
                      child: Padding(
                        padding: EdgeInsets.only(top: 1.v),
                        child: Text(
                          text,
                          style: CustomTextStyles.bodySmallBluegray800.copyWith(
                            color: Color.fromARGB(255, 57, 57, 57),
                            fontSize: 14.0, // Adjust the font size as needed
                          ),
                        ),
                      ),
                    ),
                    CustomImageView(
                      imagePath: ImageConstant.imgArrowRightBlueGray8001,
                      height: 18.adaptSize,
                      width: 18.adaptSize,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return CustomElevatedButton(
      onPressed: () async {
        try {
          await handleSignOut(context);
        } catch (e) {
          print('Error during sign-out: $e');
          // Handle the error accordingly, e.g., show a snackbar or log the issue.
        }
      },
      height: 48,
      width: 311,
      text: "lbl_log_out".tr,
      leftIcon: Container(
        margin: EdgeInsets.only(right: 14),
        child: CustomImageView(
          imagePath: ImageConstant.imgArrowrightBlueGray800,
          height: 24,
          width: 24,
        ),
      ),
      buttonStyle: CustomButtonStyles.fillWhiteA,
      buttonTextStyle: CustomTextStyles.titleMediumBluegray80018
          .copyWith(color: Colors.white),
      alignment: Alignment.center,
    );
  }

  Widget _buildBottomBarSection() {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      var currentState = navigatorKey.currentState;
      if (currentState != null) {
        try {
          String route = getCurrentRoute(type);
          currentState.pushNamed(route);
        } catch (e) {
          print("Error while navigating: $e");
          // Handle the error accordingly, e.g., show a snackbar or navigate to a default route.
        }
      } else {
        print("Error: currentState is null. Navigator state not available.");
        // Handle the error accordingly, e.g., show a snackbar or log the issue.
      }
    });
  }

  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.buyPage;
      case BottomBarEnum.Frame1000002310:
      case BottomBarEnum.Frame1000002311:
      case BottomBarEnum.Notification:
      case BottomBarEnum.Settings:
        return "/";
      default:
        throw Exception("Unexpected BottomBarEnum: $type");
    }
  }

  Future<void> handleSignOut(BuildContext context) async {
    final currentUser = _auth.currentUser;

    if (currentUser != null &&
        currentUser.providerData
            .any((info) => info.providerId == 'google.com')) {
      // User signed in with Google
      await _googleSignIn.disconnect();
    } else {
      // User signed in with Firebase Authentication
      await _auth.signOut();
    }

    // Create an instance of UserDataProvider
    UserDataProvider userDataProvider = UserDataProvider();

    // Clear user data on sign out
    await userDataProvider.clearUserData();

    // Save login status on sign out
    await _saveUserLoginStatus(false);

    // Navigate to the login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LogInScreen(),
      ),
    );
  }

  Future<void> _saveUserLoginStatus(bool isLoggedIn) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool(userLoggedInKey, isLoggedIn);
    } catch (e) {
      print('Error saving user login status: $e');
    }
  }
}
