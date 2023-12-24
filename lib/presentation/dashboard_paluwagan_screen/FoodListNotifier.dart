import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:wulap_application/presentation/data/food_menu.dart';
import 'package:hive/hive.dart';
import 'package:wulap_application/presentation/data/member.dart';
import 'package:uuid/uuid.dart';

class FoodListNotifier extends ChangeNotifier {
  final StreamController<List<FoodMenu>> _foodListController =
      StreamController<List<FoodMenu>>.broadcast();

  List<FoodMenu> _foodList = [];

  Stream<List<FoodMenu>> get foodListStream => _foodListController.stream;

  Future<void> fetchFoodList(String categoryID) async {
    try {
      print('Fetching food list for category: $categoryID');
      final Box<FoodMenu> boxFoodMenu =
          await Hive.openBox<FoodMenu>('foodMenus');

      // Fetch only non-deleted items
      final List<FoodMenu> nonDeletedFoodList = boxFoodMenu.values
          .where((food) => food.categoryID == categoryID && !food.isDeleted)
          .toList();

      // Update the _foodList property
      _foodList = List.from(nonDeletedFoodList);

      // Notify listeners about the change
      _foodListController.add(List.from(_foodList));

      print('Fetched Food list: $_foodList');

      if (_foodList.isEmpty) {
        print('Food list is empty');
      }

      if (_foodListController.hasListener) {
        print('Listeners are attached to the controller');
      } else {
        print('No listeners are attached to the controller');
      }
    } catch (error) {
      // Handle errors, e.g., log them or show a default list
      print("Error fetching data: $error");
      _foodListController.add([]);
    }
  }

  Future<void> refreshFoodList(String categoryID) async {
    try {
      print('Refreshing food list for category: $categoryID');
      await fetchFoodList(categoryID);

      // Notify listeners about the change
      _foodListController
          .add(List.from(_foodList.where((item) => !item.isDeleted)));
    } catch (error) {
      print("Error refreshing food list: $error");
    }
  }

  // Updated updateFoodItem method
  Future<void> updateFoodItem(
    FoodMenu oldFood,
    double newPrice,
    String newStartDate,
    List<Member> members,
    List<String> newMenuNames, {
    File? image,
  }) async {
    try {
      final Box<FoodMenu> boxFoodMenu =
          await Hive.openBox<FoodMenu>('foodMenus');

      // Find the item in the local list
      final index = _foodList.indexWhere((food) => food.key == oldFood.key);

      if (index != -1) {
        print('Updating food item at index $index');

        // Create a copy of the existing food item with the same key
        final updatedFood = createUpdatedFood(
          oldFood,
          newPrice,
          members,
          image,
        );

        // Delete the old item from Hive
        await boxFoodMenu.delete(oldFood.key);

        // Add the updated item to Hive
        await boxFoodMenu.put(updatedFood.key, updatedFood);

        // Remove the old item from the local list
        await removeFoodItem(oldFood);

        // Notify listeners about the change
        _foodListController
            .add(List.from(_foodList.where((item) => !item.isDeleted)));
        notifyListeners(); // Notify ChangeNotifier listeners
      } else {
        print('Food item not found for update');
      }
    } catch (error) {
      print('Error updating food item: $error');
      // Handle errors...
    }
  }

  FoodMenu createUpdatedFood(
      FoodMenu oldFood, double newPrice, List<Member> members, File? image) {
    // Generate a new UUID key for the updated food item
    String updatedFoodKey = Uuid().v4();

    final updatedFood = oldFood.copyWith(
      key: updatedFoodKey,
      totalPrice: newPrice,
      members: members,
    );

    if (image != null) {
      updatedFood.updateImagePath(image.path);
    }

    return updatedFood;
  }

  Future<void> removeFoodItem(FoodMenu food) async {
    try {
      print('Removing food item with key: ${food.key}');

      // Remove the item from the local list
      _foodList.removeWhere((item) => item.key == food.key);

      // Update the stream with the modified food list
      _foodListController
          .add(List.from(_foodList.where((item) => !item.isDeleted)));

      // Mark the item as deleted in Hive
      food.markAsDeleted();
      await food
          .save(); // Assuming you have a save method in your HiveObject class

      print('Food item removed successfully.');
    } catch (error) {
      print('Error removing food item: $error');
      // Handle errors...
    }
  }
}
