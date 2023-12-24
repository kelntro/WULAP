import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wulap_application/category.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/widgets/custom_elevated_button.dart';
import 'package:wulap_application/widgets/custom_text_form_field.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wulap_application/presentation/data/user_data_provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool _isPasswordVisible = false;
  late GoogleSignInAccount _currentUser;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final UserDataProvider userDataProvider = UserDataProvider();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String _email = "";
  String _password = "";

  // SharedPreferences key for user login status
  static const String userLoggedInKey = 'userLoggedIn';

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account!;
      });
      // ignore: unnecessary_null_comparison
      if (_currentUser != null) {
        print("User is already authenticated");
        _registerUserInFirebase(_currentUser);
        // Directly navigate to the dashboard screen
        Navigator.pushNamed(context, AppRoutes.dashboardPaluwaganScreen);
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<bool> handleSignIn() async {
    try {
      await _googleSignIn.signIn();

      // If sign-in is successful, return true
      if (_googleSignIn.currentUser != null) {
        bool registrationResult =
            await _registerUserInFirebase(_googleSignIn.currentUser!);

        if (registrationResult) {
          // Save login status
          await _saveUserLoginStatus(true);

          Navigator.pushNamed(context, AppRoutes.dashboardPaluwaganScreen);
          return true; // Sign-in and registration successful
        } else {
          // Registration failed
          _showError('User registration failed. Please try again.');
          return false;
        }
      }
      return false; // No user signed in
    } catch (error) {
      print("Sign in error: $error");
      // If sign-in fails, return false
      return false;
    }
  }

  Future<void> handleSignOut() async {
    await _googleSignIn.disconnect();
    await _auth.signOut();

    // Save login status on sign out
    await _saveUserLoginStatus(false);
  }

  Future<bool> _registerUserInFirebase(GoogleSignInAccount user) async {
    try {
      GoogleSignInAuthentication googleSignInAuthentication =
          await user.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        print("User registered in Firebase: ${firebaseUser.email}");
        return true; // Registration successful
      } else {
        print("User registration failed");
        return false; // Registration failed
      }
    } catch (e) {
      print("Error registering user in Firebase: $e");
      return false; // Registration failed due to an error
    }
  }

  Future<void> _saveUserLoginStatus(bool isLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(userLoggedInKey, isLoggedIn);
  }

  Future<bool> _getUserLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(userLoggedInKey) ?? false;
  }

  void _navigateToDashboard() async {
    // Check if the user is already logged in
    bool isLoggedIn = await _getUserLoginStatus();
    if (isLoggedIn) {
      Navigator.pushNamed(context, AppRoutes.dashboardPaluwaganScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: buildLoginForm(context),
      ),
    );
  }

  Widget buildLoginForm(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 59.v),
        child: Column(
          children: [
            _buildWelcomeText(),
            SizedBox(height: 19.v),
            _buildSignInMessage(),
            SizedBox(height: 67.v),
            _buildEmail(context),
            SizedBox(height: 28.v),
            _buildPassword(context),
            SizedBox(height: 10.v),
            _buildForgotPassword(context),
            SizedBox(height: 27.v),
            _buildLogIn(context),
            SizedBox(height: 41.v),
            _buildDividerAndText(context),
            SizedBox(height: 6.v),
            _buildGoogleSignInButton(),
            SizedBox(height: 29.v),
            _buildRegisterText(context),
            SizedBox(height: 5.v),
          ],
        ),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Text("lbl_welcome".tr, style: CustomTextStyles.titleMediumPrimary18);
  }

  Widget _buildSignInMessage() {
    return Text(
      "Sign in to continue with Wulap".tr,
      style: CustomTextStyles.bodyLargeDMSansBluegray800_1,
    );
  }

  Widget _buildEmail(BuildContext context) {
    return CustomTextFormField(
      controller: emailController,
      hintText: "email".tr,
      hintStyle: CustomTextStyles.bodyMediumBluegray800_2,
      textStyle: TextStyle(
        color: Color.fromARGB(
            255, 30, 30, 30), // Change the color to make it darker
      ),
    );
  }

  Widget _buildPassword(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      hintText: "password".tr,
      hintStyle: CustomTextStyles.bodyMediumBluegray800_2,
      textStyle: TextStyle(
        color: Color.fromARGB(
            255, 30, 30, 30), // Change the color to make it darker
      ),
      textInputAction: TextInputAction.done,
      textInputType: TextInputType.visiblePassword,
      obscureText: !_isPasswordVisible,
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

  Widget _buildForgotPassword(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapForgotPassword();
      },
      child: Container(
        height: 21.v,
        width: 122.h,
        alignment: Alignment.centerLeft,
        child: Text(
          "msg_forgot_password".tr,
          style: CustomTextStyles.bodyMediumPurpleA700,
        ),
      ),
    );
  }

  Widget _buildLogIn(BuildContext context) {
    return CustomElevatedButton(
      height: 52,
      text: "lbl_log_in".tr,
      margin: EdgeInsets.only(left: 29, right: 33),
      buttonTextStyle: CustomTextStyles.titleMediumWhiteA700,
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _handleLogin();
        }
      },
    );
  }

  Widget _buildDividerAndText(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23.h, right: 26.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.v, bottom: 26.v),
            child: SizedBox(
              width: 92.h,
              child: Divider(color: appTheme.gray500),
            ),
          ),
          Container(
            height: 37.v,
            width: 196.h,
            margin: EdgeInsets.only(left: 13.h),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 14.h),
                    child: Text(
                      "lbl_phone_number".tr,
                      style: CustomTextStyles.titleMediumOutfitWhiteA700,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.v),
                    child: SizedBox(
                      width: 89.h,
                      child: Divider(color: appTheme.gray500),
                    ),
                  ),
                ),
                Center(
                  child: Transform.translate(
                    offset: Offset(0, 0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "or continue with".tr,
                        style: CustomTextStyles.bodyMediumOutfitOnPrimary,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoogleSignInButton() {
    return GestureDetector(
      onTap: () async {
        bool success = await handleSignIn();
        if (success) {}
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: EdgeInsets.all(10.0),
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
      ),
    );
  }

  Widget _buildRegisterText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapTxtNotregisteryet(context);
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "msg_not_register_yet2".tr,
              style: CustomTextStyles.bodyLargeOutfitGray70001,
            ),
            TextSpan(
              text: "lbl_create_account".tr,
              style: CustomTextStyles.titleMediumOutfitBlack90002,
            ),
          ],
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  void _handleLogin() async {
    setState(() {
      _email = emailController.text;
      _password = passwordController.text;
    });

    // Check for empty fields
    if (_email.isEmpty || _password.isEmpty) {
      _showErrorDialog(
        "Login Error",
        "Please fill in all fields.",
      );
      return;
    }

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _email,
        password: _password,
      );

      print("User Logged In: ${userCredential.user!.email}");

      // Save login status
      await _saveUserLoginStatus(true);

      // Open Hive box for the current user
      String userId = userCredential.user!.uid;
      var userBox = await Hive.openBox<Category>('categories_$userId');

      // Close the Hive box when you are done using it
      userBox.close();

      // Navigate to the dashboard
      _navigateToDashboard();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        _showErrorDialog(
          "Login Error",
          "Incorrect email or password. Please try again.",
        );
      } else {
        print("Error During Logged In: $e");
        _showErrorDialog(
          "Login Error",
          "An error occurred during login. Please try again later.",
        );
      }
    } catch (e) {
      print("Unexpected Error During Logged In: $e");
      _showErrorDialog(
        "Login Error",
        "An unexpected error occurred. Please try again later.",
      );
    }
  }

  void _showErrorDialog(String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
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

  void onTapForgotPassword() async {
    if (_formKey.currentState?.validate() ?? false) {
      String email = emailController.text;

      // Check if the email is not null and not empty
      if (email.isNotEmpty) {
        // Perform additional email validation (you can customize this based on your requirements)
        if (!isValidEmail(email)) {
          _showError(
              'Invalid email format. Please enter a valid email address.');
          return;
        }

        try {
          // Check if the email is registered in Firebase
          await isEmailRegisteredInFirebase(email);

          // If the email is registered, proceed with sending the reset email
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

          _showSuccessDialog();
        } catch (error) {
          print("Error sending reset email: $error");
          _showError('Error sending reset email. Please try again.');
        }
      } else {
        // Handle the case where email is null or empty
        _showError('Please enter your email address.');
      }
    }
  }

  Future<bool> isEmailRegisteredInFirebase(String email) async {
    List<String> signInMethods =
        await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
    print('Sign-in methods for $email: $signInMethods');
    return signInMethods.isNotEmpty;
  }

  bool isValidEmail(String email) {
    // Add your email validation logic here
    // For a simple check, you can use a regular expression
    final RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegExp.hasMatch(email);
  }

  void _showSuccessDialog() {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: 'Success!',
      desc: 'Password reset email sent successfully.',
      btnOkOnPress: () {},
      btnOkText: 'OK',
    )..show();
  }

  void _showError(String s) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: 'Error!',
      desc: s,
      btnOkOnPress: () {},
      btnOkText: 'OK',
    )..show();
  }

  void onTapTxtNotregisteryet(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.registerScreen);
  }
}
