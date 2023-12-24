import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wulap_application/services/user_model.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Creates a new user in the Firestore database.
  ///
  /// If the user is authenticated, their information is stored in the "Users"
  /// collection with the UID as the document ID.
  ///
  /// Displays a success message if the account is created, or an error message
  /// if an error occurs.
  Future<void> createUser(UserModel user) async {
    try {
      // Get the current user from Firebase Authentication
      User? firebaseUser = FirebaseAuth.instance.currentUser;

      if (firebaseUser != null) {
        // Use UID as the document ID
        await _db.collection("Users").doc(firebaseUser.uid).set(user.toJson());

        Get.snackbar(
          "Success",
          "Your account has been created.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
        );
      } else {
        // Handle the case where the user is not authenticated
        print('Error: User is not authenticated');
        Get.snackbar(
          "Error",
          "User is not authenticated.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
      }
    } catch (error) {
      print('Error during user creation: $error');
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }

  /// Gets a stream of the user document from the Firestore "Users" collection.
  ///
  /// The stream will emit new data whenever the document is updated.
  Stream<DocumentSnapshot> getUserStream(String userId) {
    if (userId.isNotEmpty) {
      return _db.collection("Users").doc(userId).snapshots();
    } else {
      // Handle the case where userId is empty
      print('Error: userId is empty');
      // Return an empty stream or handle it based on your requirements
      return Stream.empty();
    }
  }

  /// Updates the user's profile picture URL in the Firestore database.
  ///
  /// Requires the user's UID and the new profile picture URL.
  /// Displays a success message if the update is successful, or an error
  /// message if an error occurs.
  Future<void> updateUserProfilePicture(String userId, String imageUrl) async {
    try {
      await _db
          .collection("Users")
          .doc(userId)
          .update({'ProfilePictureUrl': imageUrl});

      Get.snackbar(
        "Success",
        "Profile picture updated successfully.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      );
    } catch (error) {
      print('Error updating profile picture: $error');
      Get.snackbar(
        "Error",
        "Failed to update profile picture. Please try again.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }
}
