import 'package:hive/hive.dart';
import 'package:wulap_application/presentation/data/member.dart';
import 'package:uuid/uuid.dart';

part 'food_menu.g.dart';

@HiveType(typeId: 1)
class FoodMenu extends HiveObject {
  @HiveField(0)
  List<String> menuNames = [];

  @HiveField(1)
  String? imagePath;

  @HiveField(2)
  late double totalPrice;

  @HiveField(3)
  late String startDate;

  @HiveField(4)
  List<Member> members = [];

  @HiveField(5)
  String categoryID;

  @HiveField(6)
  String key; // Use HiveField(6) to specify the index

  @HiveField(7)
  bool isDeleted = false; // New field to track deleted status

  FoodMenu({
    required this.menuNames,
    this.imagePath,
    required this.totalPrice,
    required this.startDate,
    required this.members,
    required this.categoryID,
    String? key,
    bool isDeleted = false, // Provide a default value
  })  : key = key ?? Uuid().v4(),
        isDeleted = isDeleted; // Initialize the isDeleted field

  // New method to update the deleted status
  void markAsDeleted() {
    isDeleted = true;
  }

  // New method to update the image path
  void updateImagePath(String newPath) {
    imagePath = newPath;
  }
}

extension FoodMenuExtension on FoodMenu {
  FoodMenu copyWith({
    List<String>? menuNames,
    String? imagePath,
    double? totalPrice,
    String? startDate,
    List<Member>? members,
    String? categoryID,
    String? key,
    bool? isDeleted,
  }) {
    return FoodMenu(
      menuNames: menuNames ?? this.menuNames,
      imagePath: imagePath ?? this.imagePath,
      totalPrice: totalPrice ?? this.totalPrice,
      startDate: startDate ?? this.startDate,
      members: members ?? this.members,
      categoryID: categoryID ?? this.categoryID,
      key: key ?? this.key,
    )..isDeleted = isDeleted ?? this.isDeleted;
  }
}
