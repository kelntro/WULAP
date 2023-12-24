import 'package:flutter/material.dart';

class CategoryData {
  final String id;
  final String categoryName;
  final String slots;
  final String contributionStarted;
  String categoryID; // Include categoryID in the class

  CategoryData({
    required this.id,
    required this.categoryName,
    required this.slots,
    required this.contributionStarted,
    required this.categoryID,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryData &&
        other.id == id &&
        other.categoryName == categoryName &&
        other.slots == slots &&
        other.contributionStarted == contributionStarted &&
        other.categoryID == categoryID; // Include categoryID in the comparison
  }

  @override
  int get hashCode {
    return categoryName.hashCode ^
        slots.hashCode ^
        contributionStarted.hashCode ^
        categoryID.hashCode; // Include categoryID in the hashCode
  }

  factory CategoryData.fromMap(String id, Map<String, dynamic> map) {
    return CategoryData(
      id: id,
      categoryName: map['categoryName'] ?? '',
      slots: map['slots'] ?? '',
      contributionStarted: map['contributionStarted'] ?? '',
      categoryID: map['categoryID'] ?? '', // Include categoryID from map
    );
  }

  // Convert CategoryData instance to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'categoryName': categoryName,
      'slots': slots,
      'contributionStarted': contributionStarted,
      'categoryID': categoryID, // Include categoryID in the map
    };
  }
}

class CategoryDataProvider with ChangeNotifier {
  List<CategoryData> _categories = [];

  List<CategoryData> get categories => _categories;

  void setCategories(List<CategoryData> categories) {
    _categories = categories;
    notifyListeners();
  }

  void addCategory(CategoryData newCategory) {
    _categories.add(newCategory);
    notifyListeners();
  }

  void updateCategoryData(
      CategoryData oldCategory, CategoryData updatedCategory) {
    int index = _categories.indexWhere((category) => category == oldCategory);

    if (index != -1) {
      // Update the category if found
      _categories[index] = updatedCategory;
      notifyListeners();
    }
  }

  void deleteCategory(CategoryData category) {
    print('Deleting category: ${category}');
    _categories.remove(category);
    notifyListeners();
  }
}
