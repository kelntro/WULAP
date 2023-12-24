import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class FirebaseService {
  static Future<String> uploadImage(String imagePath) async {
    // Generate a unique filename for the image
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();

    // Create a File object from the provided image path
    File imageFile = File(imagePath);

    // Get the reference to the Firebase Storage bucket
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/$fileName');

    // Upload the image to Firebase Storage
    UploadTask uploadTask = storageReference.putFile(imageFile);

    // Wait for the upload to complete and get the download URL
    TaskSnapshot taskSnapshot = await uploadTask;
    String imageUrl = await taskSnapshot.ref.getDownloadURL();

    return imageUrl;
  }

  static Future<void> updateImage(String imageUrl) async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc('1LktBOJ4Ihac40htUevI')
        .update({
      'field_image': imageUrl,
    });
  }

  static void fetchData() {
    FirebaseFirestore.instance.collection('Users').get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        print(doc.data());
        // Access data using doc.data()['field_name']
      });
    });
  }

  static void addData() {
    FirebaseFirestore.instance.collection('Users').add({
      'field1': 'value1',
      'field2': 'value2',
      // Add other fields as needed
    });
  }

  static Future<String?> fetchImage() async {
    // Implement the logic to fetch the image URL from Firestore
    // For example:
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await FirebaseFirestore.instance.collection('Users').get();

    if (snapshot.docs.isNotEmpty) {
      return snapshot.docs.first.data()['field_image'] as String?;
    }

    return null; // Return null if the document is empty
  }
}
