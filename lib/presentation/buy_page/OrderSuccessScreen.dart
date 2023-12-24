import 'package:flutter/material.dart';
import 'package:wulap_application/routes/app_routes.dart';

class OrderSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 100.0,
            ),
            SizedBox(height: 16.0),
            Text(
              'Your Purchase is Complete',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple[900],
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 32.0),
                // Adjust the padding as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8.0), // Adjust the border radius as needed
                ),
              ),
              onPressed: () {
                // You can navigate to the home screen or any other screen after order success
                Navigator.pushNamed(context, AppRoutes.buyPage);
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
