import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:wulap_application/category.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/add_category_screen/edit_category_screen.dart';
import 'package:wulap_application/presentation/create_paluwagan_screen/food_menu_input_screen.dart';
import 'package:wulap_application/presentation/dashboard_paluwagan_screen/food_list_screen.dart';
import 'package:wulap_application/presentation/data/user_data_provider.dart';
import 'package:wulap_application/presentation/reminder_screen/reminder_screen_list.dart';
import 'package:wulap_application/widgets/app_bar/appbar_leading_image.dart';
import 'package:wulap_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:wulap_application/widgets/app_bar/custom_app_bar.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_floating_button.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class DashboardPaluwaganScreen extends StatefulWidget {
  DashboardPaluwaganScreen({Key? key}) : super(key: key);

  @override
  _DashboardPaluwaganScreenState createState() =>
      _DashboardPaluwaganScreenState();
}

class _DashboardPaluwaganScreenState extends State<DashboardPaluwaganScreen> {
  UserModel? currentUser;
  late UserDataProvider _userDataProvider;
  String? userId;

  @override
  void initState() {
    _openHiveBoxForCurrentUser();
    _initializeHiveBox();
    super.initState();
    _userDataProvider = UserDataProvider();
    fetchUserData();
  }

  Future<void> _initializeHiveBox() async {
    userId = await _openHiveBoxForCurrentUser();
    await Hive.openBox<Category>('categories_$userId');
    setState(() {});
  }

  Future<String> _openHiveBox(String userId) async {
    await Hive.openBox<Category>('categories_$userId');
    return userId;
  }

  Future<String?> _openHiveBoxForCurrentUser() async {
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      return await _openHiveBox(firebaseUser.uid);
    }
    return null;
  }

  Future<void> fetchUserData() async {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;

      if (firebaseUser != null) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('Users')
            .doc(firebaseUser.uid)
            .get();

        UserModel userData =
            UserModel.fromMap(userSnapshot.data() as Map<String, dynamic>);
        currentUser = userData;
        await _userDataProvider.saveUserData(userData);

        setState(() {});
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0), // Adjust the top padding as needed
        child: _buildCategoriesGrid(context),
      ),
      bottomNavigationBar: _buildBottomBar(context),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildCategoriesGrid(BuildContext context) {
    try {
      final box = Hive.box<Category>('categories_$userId');

      // Check if currentUser is not null
      if (currentUser != null) {
        final categories = box.values.toList();

        if (categories.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'No categories available. Tap the + button to add a new category.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Padding(
              padding: EdgeInsets.only(
                left: index % 2 == 1 ? 0.0 : 12.0,
                right: index % 2 == 0 ? 0.0 : 12.0,
              ),
              child: GestureDetector(
                onTap: () {
                  navigateToFoodListScreen(context, category.categoryID);
                },
                child: Card(
                  elevation: 4.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  color: Color.fromARGB(255, 247, 240, 255),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AspectRatio(
                        aspectRatio: 3 / 2.2,
                        child: Stack(
                          alignment: Alignment.topRight,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(16.0),
                                topRight: Radius.circular(16.0),
                              ),
                              child: category.imagePath != null
                                  ? Image.file(
                                      File(category.imagePath!),
                                      fit: BoxFit.cover,
                                      height: double.infinity,
                                      width: double.infinity,
                                    )
                                  : Container(
                                      color: const Color.fromARGB(
                                          255, 224, 224, 224),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: PopupMenuButton(
                                itemBuilder: (BuildContext context) => [
                                  PopupMenuItem(
                                    child: ListTile(
                                      leading: Icon(Icons.edit),
                                      title: Text('Edit'),
                                      onTap: () {
                                        Navigator.pop(context);
                                        _editCategory(category);
                                      },
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: ListTile(
                                      leading: Icon(Icons.delete),
                                      title: Text('Delete'),
                                      onTap: () {
                                        Navigator.pop(context);
                                        _deleteCategory(category);
                                      },
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: ListTile(
                                      leading: Icon(Icons.add),
                                      title: Text('Add Menu'),
                                      onTap: () {
                                        _navigateToAddMenuScreen(
                                            context, category.categoryID);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(height: 1.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Slots: ${category.slots}',
                                  style: TextStyle(fontSize: 11.0),
                                ),
                                Text(
                                  '${category.date}',
                                  style: TextStyle(fontSize: 11.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      } else {
        // If currentUser is null, show a loading indicator or an appropriate widget
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    } catch (error) {
      // Handle HiveError gracefully
      print('HiveError: ${error.toString()}');
      print('Box not found. Did you forget to call Hive.openBox()?');
      // You can show a message to the user if needed, or just log the error
      // Return a placeholder widget or an empty grid
      return Container(); // Adjust this based on your UI requirements
    }
  }

// Function to edit the selected category
  void _editCategory(Category category) {
    try {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditCategoryScreen(
            category: category,
          ),
        ),
      );
    } catch (e) {
      print('Error navigating to edit screen: $e');
    }
  }

// Function to delete the selected category
  void _deleteCategory(Category category) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete ${category.name}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _performDelete(category);
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

// Helper function to perform the actual deletion
  void _performDelete(Category category) {
    try {
      User? firebaseUser = FirebaseAuth.instance.currentUser;

      if (firebaseUser != null) {
        final box = Hive.box<Category>('categories_${firebaseUser.uid}');
        print('Keys in the box: ${box.keys}');
        print('Categories in the box: ${box.values}');

        // Find the key associated with the category
        final key = box.keys.firstWhere(
          (key) => box.get(key) == category,
          orElse: () => null,
        );
        if (key != null) {
          box.delete(key); // Delete the category using the found key
          setState(() {
            // Update the UI after deletion
          });
          print('Deleted category: ${category.name}');
        } else {
          print('Category not found for deletion: ${category.name}');
        }
      } else {
        print('User not logged in.');
      }
    } catch (e) {
      print('Error performing delete: $e');
      // Handle the error as needed
    }
  }

  navigateToFoodListScreen(BuildContext context, String categoryID) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodListScreen(categoryID: categoryID),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 80,
      leadingWidth: 80,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgProfile34x34,
        margin: EdgeInsets.only(
          left: 20.h,
          top: 11.v,
          bottom: 11.v,
        ),
      ),
      title: AppbarSubtitle(
        text:
            currentUser != null ? "Hello! ${currentUser!.userName}".tr : "User",
        margin: EdgeInsets.only(left: 18.h, top: 14),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.fromLTRB(25.h, 20.v, 25.h, 11.v),
          child: Column(
            children: [
              _buildNotificationIcon(context),
              SizedBox(height: 1.v),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationIcon(BuildContext context) {
    return SizedBox(
      height: 19.adaptSize,
      width: 19.adaptSize,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgVectorPrimary,
            height: 19.adaptSize,
            width: 19.adaptSize,
            alignment: Alignment.center,
            onTap: () {
              onTapImgVector(context);
            },
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 6.adaptSize,
              width: 6.adaptSize,
              margin: EdgeInsets.only(
                left: 12.h,
                top: 1.v,
                bottom: 11.v,
              ),
              decoration: BoxDecoration(
                color: appTheme.redA700,
                borderRadius: BorderRadius.circular(3.h),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(context, getCurrentRoute(type));
    });
  }

  /// Section Widget
  Widget _buildFloatingActionButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.addCategoryScreen);
      },
      child: ClipOval(
        child: CustomFloatingButton(
          height: 45,
          width: 45,
          backgroundColor: theme.colorScheme.primary,
          decoration: null, // Set this to null to remove the border or outline
          child: CustomImageView(
            imagePath: ImageConstant.imgAdd,
            height: 27.5,
            width: 27.5,
          ),
        ),
      ),
    );
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.buyPage;
      case BottomBarEnum.Frame1000002310:
      case BottomBarEnum.Frame1000002311:
      case BottomBarEnum.Notification:
      case BottomBarEnum.Settings:
      default:
        return "/";
    }
  }

  onTapImgVector(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RemindersListScreen()));
  }

  @override
  void dispose() {
    Hive.close(); // Close all opened Hive boxes when the widget is disposed
    super.dispose();
  }

  void _navigateToAddMenuScreen(BuildContext context, String categoryID) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodMenuInputScreen(categoryID: categoryID),
      ),
    );
  }
}

/// Navigates to the notificationsScreen when the action is triggered.
onTapVector(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.notificationsScreen);
}

/// Navigates to the setAScreen when the action is triggered.
onTapViewMenuButton(BuildContext context) {
  Navigator.pushNamed(context, AppRoutes.setAScreen);
}
