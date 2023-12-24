import 'package:hive/hive.dart';
import 'package:wulap_application/presentation/data/food_menu.dart';

Future<void> clearHiveBox() async {
  // Open the box with the correct type (FoodMenu)
  final box = await Hive.openBox<FoodMenu>('foodMenus');

  // Clear the contents of the box
  await box.clear();

  // Close the box
  await box.close();
}
