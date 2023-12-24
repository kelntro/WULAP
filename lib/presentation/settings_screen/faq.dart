import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQ',
            style: TextStyle(color: const Color.fromARGB(255, 37, 37, 37))),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFAQItem(
                question: 'What is Wulap?',
                answer:
                    'Wulap is an innovative app that revolutionizes the Paluwagan experience. It empowers communities and simplifies the Paluwagan tradition.',
              ),
              _buildFAQItem(
                question: 'How do I sign up for Wulap?',
                answer:
                    'You can sign up by downloading the Wulap app and following the registration process.',
              ),
              _buildFAQItem(
                question: 'Is Wulap available on both Android and iOS?',
                answer:
                    'Yes, Wulap is available on both the Android and iOS platforms. You can download it from the respective app stores.',
              ),
              _buildFAQItem(
                question: 'How can I reset my password?',
                answer:
                    'You can reset your password through the app. Visit the settings screen and choose the option to reset your password.',
              ),
              // Add more FAQ items as needed
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFAQItem({required String question, required String answer}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFAQQuestion(question),
        _buildFAQAnswer(answer),
        SizedBox(height: 20.0), // Adjust spacing between FAQ items
      ],
    );
  }

  Widget _buildFAQQuestion(String question) {
    return Text(
      question,
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildFAQAnswer(String answer) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        answer,
        style: TextStyle(
          fontSize: 14.0,
          color: Colors.grey[800],
        ),
      ),
    );
  }
}
