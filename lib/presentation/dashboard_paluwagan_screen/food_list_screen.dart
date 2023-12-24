import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:wulap_application/core/app_export.dart';
import 'package:wulap_application/presentation/dashboard_paluwagan_screen/FoodListNotifier.dart';
import 'package:wulap_application/presentation/dashboard_paluwagan_screen/edit_food_item_screen.dart';
import 'package:wulap_application/presentation/data/food_menu.dart';
import 'package:wulap_application/presentation/data/member.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class FoodListScreen extends StatefulWidget {
  final String categoryID;

  FoodListScreen({required this.categoryID});

  @override
  _FoodListScreenState createState() => _FoodListScreenState();
}

class _FoodListScreenState extends State<FoodListScreen> {
  final FoodListNotifier _foodListNotifier = FoodListNotifier();

  @override
  void initState() {
    _foodListNotifier.fetchFoodList(widget.categoryID);
    _foodListNotifier.foodListStream.listen((List<FoodMenu> foodList) {
      print('Received updated food list: $foodList');
    });
    super.initState();
  }

  @override
  void dispose() {
    _foodListNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Food List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
      ),
      body: _buildFoodList(),
      bottomNavigationBar: _buildBottomBar(context),
    );
  }

  Widget _buildFoodList() {
    return StreamBuilder<List<FoodMenu>>(
      stream: _foodListNotifier.foodListStream,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          print("Received data: ${snapshot.data}");
          print("Food list length: ${snapshot.data!.length}");
          return snapshot.data!.isEmpty
              ? Center(child: Text('List is empty'))
              : ListView.separated(
                  itemCount: snapshot.data!.length,
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final food = snapshot.data![index];
                    return Card(
                      elevation: 5.0,
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Stack(
                        children: [
                          ListTile(
                            dense: true,
                            // Adjust padding
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 8),
                                Text(
                                  "Price: ₱${food.totalPrice.toStringAsFixed(2)}",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Roboto',
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Menu:",
                                  style: TextStyle(fontSize: 14),
                                ),
                                for (int i = 0; i < food.menuNames.length; i++)
                                  Text(
                                    "${i + 1}. ${food.menuNames[i]}",
                                    style: TextStyle(fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                Text(
                                  "Date: ${food.startDate}",
                                  style: TextStyle(fontSize: 14),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "Members:",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                for (Member member in food.members)
                                  GestureDetector(
                                    onTap: () => _showMemberDetails(member),
                                    child: Text(
                                      " ${member.name}",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color.fromARGB(255, 151, 0, 221),
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          if (food.imagePath != null &&
                              food.imagePath!.isNotEmpty)
                            Positioned(
                              top: 24,
                              right: 40,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.file(
                                  File(food.imagePath!),
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          Positioned(
                            top: 16,
                            right: 0,
                            child: PopupMenuButton(
                              itemBuilder: (BuildContext context) => [
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: Icon(Icons.edit),
                                    title: Text('Edit'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _editFoodItem(food);
                                    },
                                  ),
                                ),
                                PopupMenuItem(
                                  child: ListTile(
                                    leading: Icon(Icons.delete),
                                    title: Text('Delete'),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _deleteFoodItem(food);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
        } else {
          // If no data is available, display a loading indicator or a message
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  void _editFoodItem(FoodMenu food) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditFoodItemScreen(
          food: food,
          foodListNotifier: _foodListNotifier,
          imagePath: food.imagePath,
        ),
      ),
    );
  }

  void _deleteFoodItem(FoodMenu food) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Confirm Delete"),
          content: Text("Are you sure you want to delete this item?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                _performDeleteOperation(food);
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  void _performDeleteOperation(FoodMenu food) async {
    try {
      print('Performing delete operation for food item with key: ${food.key}');

      _foodListNotifier.removeFoodItem(food);

      await _foodListNotifier.fetchFoodList(widget.categoryID);

      print('Food item removed successfully.');
    } catch (error) {
      print('Error performing delete operation: $error');
    }
  }

  void _showMemberDetails(Member member) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Member Details"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Name: ${member.name}"),
            SizedBox(height: 8),
            InkWell(
              onTap: () => _launchEmail(member.email),
              child: RichText(
                text: TextSpan(
                  text: 'Email: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${member.email}',
                      style: TextStyle(
                        color: Colors.purple[900],
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: () => _launchPhoneNumber(member.phoneNumber),
              child: RichText(
                text: TextSpan(
                  text: 'Phone Number: ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '${member.phoneNumber}',
                      style: TextStyle(
                        color: Colors.purple[900],
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            Text("Address: ${member.address}"),
            SizedBox(height: 8),
            Text("Facebook Name: ${member.facebookName}"),
            SizedBox(height: 8),
            Text("Receiver Month: ${member.monthRecieve}"),
            SizedBox(height: 8),
            Text(
                "Contribution Date: ${_formatContributionDate(member.contributionDate)}"),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }

  String _formatContributionDate(DateTime contributionDate) {
    // Format the contribution date as needed
    return DateFormat('MM-dd-yyyy').format(contributionDate);
  }

  void _launchEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    // ignore: deprecated_member_use
    await launch(emailLaunchUri.toString());
  }

  void _launchPhoneNumber(String phoneNumber) async {
    final Uri phoneLaunchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    // ignore: deprecated_member_use
    await launch(phoneLaunchUri.toString());
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(context, getCurrentRoute(type));
    });
  }

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
}
