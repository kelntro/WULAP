import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:wulap_application/presentation/settings_screen/profileInformationScreen.dart';

// ignore: must_be_immutable
class AppbarLeadingImage extends StatelessWidget {
  AppbarLeadingImage({
    Key? key,
    this.margin,
    this.onTap,
    required String imagePath,
  }) : super(
          key: key,
        );

  EdgeInsetsGeometry? margin;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    // Get the current user ID
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    if (userId == null) {
      // Handle the case where userId is null.
      return Container(); // You can return an empty container or another widget.
    }

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('Users').doc(userId).get(),
      builder: (context, snapshot) {
        if (snapshot.hasError || !snapshot.hasData || !snapshot.data!.exists) {
          print('Error is: ${snapshot.error}');
          print('Document exists: ${snapshot.data?.exists}');
          return Icon(Icons.error);
        }

        Map<String, dynamic> userData =
            snapshot.data!.data() as Map<String, dynamic>;
        String profilePictureUrl = (userData['profilePictureUrl'] ?? '').trim();

        return GestureDetector(
          onTap: () async {
            User? user = FirebaseAuth.instance.currentUser;

            if (user != null) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProfileInformationScreen(userId: user.uid),
                ),
              );
            } else {
              // Handle the case where the user is not authenticated
              print("User not authenticated");
            }
          },
          child: Padding(
            padding: margin ?? EdgeInsets.zero,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: profilePictureUrl.isNotEmpty
                  ? CachedNetworkImageProvider(profilePictureUrl)
                      as ImageProvider<Object>?
                  : AssetImage('assets/images/default_profile_image.png'),
              backgroundColor: Colors.transparent,
            ),
          ),
        );
      },
    );
  }
}
