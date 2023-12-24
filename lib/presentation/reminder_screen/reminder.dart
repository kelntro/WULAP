import 'package:hive/hive.dart';

part 'reminder.g.dart';

@HiveType(typeId: 4)
class Reminder extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late String description;

  @HiveField(2)
  late DateTime dateTime;

  Reminder({
    required this.title,
    required this.description,
    required this.dateTime,
  });
}
