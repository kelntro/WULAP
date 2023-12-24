import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder.dart';

class ReminderProvider extends ChangeNotifier {
  late Box<Reminder> _reminderBox;
  bool _isInitialized = false;

  List<Reminder> get reminders => _reminderBox.values.toList();
  bool get isInitialized => _isInitialized;

  Future<void> initialize() async {
    try {
      if (!Hive.isBoxOpen('reminders')) {
        await Hive.openBox<Reminder>('reminders');
      }
      _reminderBox = Hive.box<Reminder>('reminders');
      _isInitialized = true;
    } catch (error) {
      print('Error initializing ReminderProvider: $error');
    }
    notifyListeners();
  }

  Future<void> addReminder(Reminder reminder) async {
    await _reminderBox.add(reminder);

    notifyListeners();
  }

  Future<void> updateReminder(int index, Reminder updatedReminder) async {
    await _reminderBox.putAt(index, updatedReminder);
    notifyListeners();
  }

  Future<void> deleteReminder(int index) async {
    final reminderToDelete = _reminderBox.getAt(index);
    if (reminderToDelete != null) {
      await _reminderBox.delete(reminderToDelete.key);
      notifyListeners();
    }
  }
}
