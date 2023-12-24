import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us',
            style: TextStyle(color: const Color.fromARGB(255, 37, 37, 37))),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Our Mission'),
            _buildSectionText(
              'To revolutionize the Paluwagan experience and empower communities through our innovative WULAP app.',
            ),
            SizedBox(height: 20.0),
            _buildSectionHeader('Who We Are'),
            _buildSectionText(
              'WULAP is a team of passionate individuals dedicated to simplifying and enhancing the Paluwagan tradition. We believe in fostering trust, community, and convenience through our application.',
            ),
            SizedBox(height: 20.0),
            _buildSectionHeader('Contact Us'),
            _buildSectionText(
              'Email: info@wulap.com\nPhone: +123 456 7890\nAddress: 123 Main Street, Davao city',
            ),
          ],
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
      ),
    );
  }

  Widget _buildSectionText(String text) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 14.0),
      ),
    );
  }
}
