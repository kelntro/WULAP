import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wulap_application/core/utils/image_constant.dart';
import 'package:wulap_application/routes/app_routes.dart';
import 'package:wulap_application/theme/theme_helper.dart';
import 'package:wulap_application/widgets/custom_bottom_bar.dart';
import 'package:wulap_application/widgets/custom_floating_button.dart';
import 'package:wulap_application/widgets/custom_image_view.dart';
import 'package:wulap_application/widgets/custom_search_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyPostsScreen extends StatefulWidget {
  const MyPostsScreen({Key? key}) : super(key: key);

  @override
  _MyPostsScreenState createState() => _MyPostsScreenState();
}

class _MyPostsScreenState extends State<MyPostsScreen> {
  List<Map<String, String>> postsData = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch data from Firebase Firestore on initialization
    fetchPostsData();
    searchController.addListener(() {
      setState(
          () {}); // Trigger a rebuild when the user types in the search bar
    });
  }

  Future<void> fetchPostsData() async {
    try {
      // Get the current user
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser == null) {
        print('Error: User is not authenticated');
        return;
      }

      // Access the collection 'postTracking' for the current user
      CollectionReference postsCollection = FirebaseFirestore.instance
          .collection('Users')
          .doc(firebaseUser.uid)
          .collection('postTracking');

      // Get documents from the collection
      QuerySnapshot<Object?> querySnapshot = await postsCollection.get();

      // Update postsData list with Firebase data
      setState(() {
        postsData = querySnapshot.docs
            .map<Map<String, String>>((QueryDocumentSnapshot<Object?> doc) {
          final data = doc.data() as Map<String, dynamic>;
          return {
            'menuItem': data['menuItem']?.toString() ?? '',
            'category': data['category']?.toString() ?? '',
            'datePosted': data['datePosted']?.toString() ?? '',
            'link': data['link']?.toString() ?? '',
          };
        }).toList();
      });
    } catch (error) {
      print('Error fetching posts data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 16),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 19, right: 18),
                          child: CustomSearchView(
                            controller: searchController,
                            hintText: "Search",
                          ),
                        ),
                        SizedBox(height: 22),
                        _buildMenuItemsList(),
                        SizedBox(height: 29),
                        // Add more UI elements here based on your data
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
        floatingActionButton: _buildFloatingActionButton(context),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.setAScreen);
        },
      ),
      centerTitle: true,
      title: Text(
        "Post Tracking",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildMenuItemsList() {
    // Use filteredPosts instead of postsData
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: filteredPosts.length,
      itemBuilder: (context, index) {
        return _buildPostItem(filteredPosts[index]);
      },
    );
  }

  Widget _buildPostItem(Map<String, String> postData) {
    return Dismissible(
      key: Key(postData['menuItem']!), // Use a unique key for each item
      background: Container(
        color: Colors.red, // Background color when swiping for deletion
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      confirmDismiss: (direction) async {
        // Implement your logic to confirm deletion (e.g., show a dialog)
        return true; // Return true to allow deletion
      },
      onDismissed: (direction) {
        // Implement your logic to handle item deletion
        // Remove the item from the data source and update the UI
        setState(() {
          postsData.remove(postData);
        });
      },
      child: Card(
        elevation: 2.0,
        margin: EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text(
            postData['menuItem']!,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Category: ${postData['category']}"),
              Text("Date Posted: ${postData['datePosted']}"),
              InkWell(
                onTap: () {
                  // Implement logic to visit the link
                  // You can use a package like url_launcher to open the link
                },
                child: Text(
                  "Link: ${postData['link']}",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          trailing: PopupMenuButton<String>(
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'edit',
                  child: ListTile(
                    leading: Icon(Icons.edit),
                    title: Text('Edit'),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'delete',
                  child: ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Delete'),
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'visitLink',
                  child: ListTile(
                    leading: Icon(Icons.link),
                    title: Text('Visit Link'),
                  ),
                ),
              ];
            },
            onSelected: (String value) {
              if (value == 'edit') {
                // Implement logic to handle edit
                // You can navigate to an edit screen or show a dialog
                // For example, navigate to an edit screen:
              } else if (value == 'delete') {
                // Implement logic to handle deletion
                // You may want to show a confirmation dialog
              } else if (value == 'visitLink') {
                // Implement logic to visit the link
                // You can use a package like url_launcher to open the link
              }
            },
          ),
        ),
      ),
    );
  }

  List<Map<String, String>> get filteredPosts {
    // Use the computed property to get the filtered posts
    return postsData
        .where((post) =>
            post['menuItem']!
                .toLowerCase()
                .contains(searchController.text.toLowerCase()) ||
            post['category']!
                .toLowerCase()
                .contains(searchController.text.toLowerCase()))
        .toList();
  }

  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {
      Navigator.pushNamed(context, getCurrentRoute(type));
    });
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.myPostsoneScreen);
      },
      child: CustomFloatingButton(
        height: 45,
        width: 45,
        backgroundColor: theme.colorScheme.primary,
        decoration: FloatingButtonStyleHelper.outlineWhiteA,
        child: CustomImageView(
          imagePath: ImageConstant.imgAdd,
          height: 22.5,
          width: 22.5,
        ),
      ),
    );
  }

  String getCurrentRoute(BottomBarEnum type) {
    // Implement your logic to determine the route based on the BottomBarEnum
    return "/";
  }
}
