import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wulap_application/core/app_export.dart';

class ChangePasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ChangePasswordForm(),
      ),
    );
  }
}

class ChangePasswordForm extends StatefulWidget {
  @override
  _ChangePasswordFormState createState() => _ChangePasswordFormState();
}

class _ChangePasswordFormState extends State<ChangePasswordForm> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController retypePasswordController =
      TextEditingController();

  String? currentPasswordError;
  String? newPasswordError;
  String? retypePasswordError;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: currentPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Current Password',
              errorText: currentPasswordError,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: newPasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'New Password',
              errorText: newPasswordError,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: retypePasswordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Retype Password',
              errorText: retypePasswordError,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 32.0),
          ElevatedButton(
            onPressed: () async {
              if (validatePassword()) {
                User? user = FirebaseAuth.instance.currentUser;

                if (user != null) {
                  AuthCredential credential = EmailAuthProvider.credential(
                    email: user.email!,
                    password: currentPasswordController.text,
                  );

                  try {
                    await user.reauthenticateWithCredential(credential);

                    // User is re-authenticated, proceed to change password
                    await user.updatePassword(newPasswordController.text);

                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Password Changed'),
                        content: Text(
                            'Your password has been changed successfully!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.popUntil(
                                context,
                                ModalRoute.withName(AppRoutes.settingsScreen),
                              );
                            },
                            child: Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } catch (e) {
                    print('Error changing password: $e');
                    // Handle errors, show appropriate error messages
                  }
                }
              }
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.purple[900],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Change Password',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white, // Set the color to white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool validatePassword() {
    final String newPassword = newPasswordController.text;
    final String retypePassword = retypePasswordController.text;

    // Reset error messages
    setState(() {
      newPasswordError = null;
      retypePasswordError = null;
    });

    // Check if the new password is not null
    if (newPassword.isEmpty) {
      setState(() {
        newPasswordError = 'New password cannot be empty';
      });
      return false;
    }

    // Check if the retyped password matches the new password
    if (newPassword != retypePassword) {
      setState(() {
        retypePasswordError = 'Passwords do not match';
      });
      return false;
    }
    return true;
  }
}
