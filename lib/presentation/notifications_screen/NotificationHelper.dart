// NotificationHelper.dart
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;

class NotificationHelper {
  static late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  static Future<void> initialize() async {
    try {
      tz.initializeTimeZones(); // Initialize time zones
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

      final InitializationSettings initializationSettings =
          InitializationSettings(
        android: AndroidInitializationSettings(
            'app_icon'), // Change to your app icon name
      );

      await _flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
      );

      print('Notification plugin initialized successfully.');
    } catch (e) {
      print('Error initializing notification plugin: $e');
    }
  }

  static Future<void> showNotification(
      int id, String title, String body) async {
    try {
      // ignore: unnecessary_null_comparison
      if (_flutterLocalNotificationsPlugin == null) {
        print('Notification plugin not initialized. Call initialize() first.');
        return;
      }

      final AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'com.wulapapplication.app', // Change this to your channel ID
        'Wulap',
        importance: Importance.max,
        priority: Priority.high,
        icon: 'app_icon', // Change to your app icon name
      );

      final NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatformChannelSpecifics);

      await _flutterLocalNotificationsPlugin.show(
        id,
        'Notification reminder', // Custom header or title
        '$title\n$body', // Combining title and body
        platformChannelSpecifics,
      );
    } catch (e) {
      print('Error showing notification: $e');
    }
  }
}
