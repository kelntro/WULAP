import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage _storage = FirebaseStorage.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class StorageData {
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName).child('id');
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<void> saveData({
    required Uint8List profilePictureUrl,
  }) async {
    try {
      // Get the current user from Firebase Authentication
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userId = user.uid;

        String imageUrl =
            await uploadImageToStorage('Users', profilePictureUrl);

        // Update the existing user document with the new profilePictureUrl
        await _firestore.collection('Users').doc(userId).update({
          'profilePictureUrl':
              imageUrl, // Update to match the field name in your UserModel class
        });
      } else {
        print('Error: User is not authenticated');
      }
    } catch (e) {
      print('Error saving data: $e');
    }
  }
}
