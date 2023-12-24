import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

part 'note.g.dart';

@HiveType(typeId: 3)
class Note extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late String link;

  @HiveField(3)
  late DateTime date;
  Note({
    required this.title,
    required this.link,
    required this.date,
  }) : id = Uuid().v4();

  String formattedDate() {
    return DateFormat('MM-dd-yyyy').format(date);
  }
}
