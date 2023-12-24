import 'package:flutter/material.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder_provider.dart';

class NotificationsProvider extends ChangeNotifier {
  late List<Reminder> _notifications = []; // Initialize _notifications here
  bool _isInitialized = false;

  List<Reminder> get notifications => _notifications;
  bool get isInitialized => _isInitialized;

  Future<void> initialize(ReminderProvider reminderProvider) async {
    // Initialize the list of notifications by filtering reminders based on their dateTime
    _notifications = reminderProvider.reminders
        .where((reminder) => reminder.dateTime.isBefore(DateTime.now()))
        .toList();

    // Notify listeners when initialization is complete
    _isInitialized = true;

    // Add this line to notify listeners immediately after initialization
    notifyListeners();
  }

  Future<void> addNotification(Reminder reminder) async {
    // Add a new notification
    _notifications.add(reminder);

    // Notify listeners about the change in notifications
    notifyListeners();
  }

  Future<void> deleteNotificationAndReminder(
      int index, ReminderProvider reminderProvider) async {
    // Get the reminder associated with the notification
    final reminder = _notifications[index];

    // Delete the notification from the provider
    _notifications.removeAt(index);

    // Notify listeners about the change in notifications
    notifyListeners();

    // Delete the corresponding reminder from the ReminderProvider
    final reminderIndex = reminderProvider.reminders.indexOf(reminder);

    if (reminderIndex != -1) {
      reminderProvider.deleteReminder(reminderIndex);
    }
  }
}
