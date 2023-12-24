import 'package:hive/hive.dart';
import 'package:wulap_application/boxes.dart';

part 'category.g.dart';

@HiveType(typeId: 0)
class Category extends HiveObject {
  Category({
    required this.name,
    required this.slots,
    required this.date,
    this.imagePath,
    required this.categoryID,
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  int slots;

  @HiveField(2)
  String date;

  @HiveField(3)
  String? imagePath;

  @HiveField(4)
  String categoryID;

  void updateImagePath(String newPath) {
    imagePath = newPath;
    save(); // Save the object to Hive after updating the image path

    // Ensure that boxCategory is defined and accessible
    // ignore: unnecessary_null_comparison
    if (boxCategory != null) {
      boxCategory.put(categoryID, this); // Save the updated object to the box
    }
  }
}
