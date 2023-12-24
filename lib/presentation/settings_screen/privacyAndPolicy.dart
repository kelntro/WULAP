import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy',
            style: TextStyle(color: const Color.fromARGB(255, 37, 37, 37))),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('Introduction'),
              _buildSectionText(
                'Welcome to the Wulap app Privacy Policy. This policy describes how we collect, use, and share your personal information. By using our app, you agree to the terms of this Privacy Policy.',
              ),
              SizedBox(height: 20.0),
              _buildSectionHeader('Information We Collect'),
              _buildSectionText(
                'We may collect the following types of information:\n\n'
                '- Personal information, such as your name, email address, and phone number.\n'
                '- Usage information, such as the pages you visit and features you use.\n'
                '- Device information, such as your device type and operating system.',
              ),
              SizedBox(height: 20.0),
              _buildSectionHeader('How We Use Your Information'),
              _buildSectionText(
                'We use your information for various purposes, including:\n\n'
                '- Providing and improving our services.\n'
                '- Customizing content based on your preferences.\n'
                '- Communicating with you about updates and promotions.',
              ),
              SizedBox(height: 20.0),
              _buildSectionHeader('Information Sharing'),
              _buildSectionText(
                'We may share your information with third parties for the following purposes:\n\n'
                '- With your consent.\n'
                '- To comply with legal obligations.\n'
                '- To protect our rights and interests.',
              ),
              SizedBox(height: 20.0),
              _buildSectionHeader('Contact Us'),
              _buildSectionText(
                'If you have any questions or concerns about our Privacy Policy, please contact us at:\n\n'
                'Email: privacy@wulap.com\n'
                'Address: 456 Main Street, Davao city',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
