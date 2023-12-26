import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wulap_application/presentation/settings_screen/add_data.dart';
import 'package:wulap_application/presentation/settings_screen/utils.dart';
import 'package:wulap_application/services/user_model.dart';
import 'package:wulap_application/repository/user_repository.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class ProfileInformationScreen extends StatefulWidget {
  final String userId;

  ProfileInformationScreen({required this.userId});

  @override
  _ProfileInformationScreenState createState() =>
      _ProfileInformationScreenState();
}

class _ProfileInformationScreenState extends State<ProfileInformationScreen> {
  List<Uint8List?> _certificationImages = List.generate(3, (_) => null);
  Uint8List? _image;
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController facebookLinkController = TextEditingController();
  TextEditingController businessInfoController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _image = null;
  }

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Image selected successfully'),
        duration: Duration(seconds: 2),
      ),
    );

    setState(() {
      _image = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile Information',
          style: TextStyle(color: const Color.fromARGB(255, 69, 69, 69)),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon:
                Icon(Icons.save, color: const Color.fromARGB(255, 71, 71, 71)),
            onPressed: saveProfile,
          ),
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: UserRepository.instance.getUserStream(widget.userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading();
          }

          if (snapshot.hasError) {
            return _buildError('Error: ${snapshot.error}');
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return _buildError('User not found');
          }

          UserModel user =
              UserModel.fromJson(snapshot.data!.data() as Map<String, dynamic>);

          // Set initial values for text controllers
          phoneNumberController.text = user.phoneNumber ?? '';
          facebookLinkController.text = user.facebookLink ?? '';
          businessInfoController.text = user.businessInformation ?? '';
          addressController.text = user.address ?? '';

          return _buildUserProfile(user, context);
        },
      ),
    );
  }

  Widget _buildCertificationImages(UserModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14.0),
        Text(
          'Certifications:',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.purple[900],
          ),
        ),
        SizedBox(height: 4.0),
        Row(
          children: List.generate(
            _certificationImages.length,
            (index) => _buildCertificationImage(index, user),
          ),
        ),
      ],
    );
  }

  Widget _buildCertificationImage(int index, UserModel user) {
    return GestureDetector(
      onTap: () {
        // Open a dialog with a larger image when tapped
        _showCertificationImageDialog(user.certificationImageUrls[index]);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Stack(
          children: [
            if (_certificationImages[index] != null)
              Container(
                width: 103,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: MemoryImage(_certificationImages[index]!),
                  ),
                ),
              )
            // ignore: unnecessary_null_comparison
            else if (user.certificationImageUrls != null &&
                user.certificationImageUrls.isNotEmpty &&
                user.certificationImageUrls.length > index)
              Container(
                width: 103,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(user.certificationImageUrls[index]),
                  ),
                ),
              )
            else
              Container(
                width: 103,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://img.freepik.com/free-vector/gradient-elegant-certificate_52683-63963.jpg?w=740&t=st=1702892477~exp=1702893077~hmac=c0a9cbf9e47dfe4a92f33d34eb9f0173a1ab5fa27c8b39f033020d61a122b8ef'),
                  ),
                ),
              ),
            Positioned(
              bottom: -10,
              right: 0,
              child: IconButton(
                onPressed: () => selectCertificationImage(index),
                icon: const Icon(Icons.add_a_photo),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show a larger certification image in a dialog
  void _showCertificationImageDialog(String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
              ),
            ),
          ),
        );
      },
    );
  }

  void selectCertificationImage(int index) async {
    Uint8List img = await pickImage(ImageSource.gallery);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Certification Image selected successfully'),
        duration: Duration(seconds: 2),
      ),
    );

    setState(() {
      _certificationImages[index] = img;
    });
  }

  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildError(String message) {
    return Center(child: Text(message));
  }

  Widget _buildUserProfile(UserModel user, BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align the column to the left
        children: [
          _buildProfilePicture(user.profilePictureUrl, user.id),
          _buildProfileFields(user),
          _buildCertificationImages(user),
        ],
      ),
    );
  }

  Widget _buildProfileFields(UserModel user) {
    return Container(
      margin: EdgeInsets.only(top: 4.0), // Add margin to the top
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align the column to the left
        children: [
          _buildProfileField('Name', user.userName),
          _buildProfileField('Email', user.email),
          _buildInputCard('Phone Number', phoneNumberController),
          _buildInputCard('Address', addressController),
          _buildInputCard('Facebook Link', facebookLinkController),
          _buildInputCard('Business Information', businessInfoController),
        ],
      ),
    );
  }

  void saveProfile() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final snackBar = SnackBar(
        content: Text('Saving changes...'),
        duration: Duration(seconds: 2),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // Upload and store certification images
      List<String> certificationImageUrls = [];
      for (Uint8List? certificationImage in _certificationImages) {
        if (certificationImage != null) {
          String certificationImageUrl = await StorageData()
              .uploadImageToStorage('Users', certificationImage);
          certificationImageUrls.add(certificationImageUrl);
        }
      }

      try {
        String userId = user.uid;

        // Validate input fields before updating Firebase
        bool isPhoneNumberValid =
            validatePhoneNumber(phoneNumberController.text);

        if (isPhoneNumberValid) {
          // Get the profile picture URL
          String imageUrl = _image != null
              ? await StorageData().uploadImageToStorage('Users', _image!)
              : '';

          Map<String, dynamic> updatedData = {
            'profilePictureUrl': imageUrl,
            'phoneNumber': phoneNumberController.text,
            'facebookLink': facebookLinkController.text,
            'businessInformation': businessInfoController.text,
            'address': addressController.text,
            'certificationImageUrls': certificationImageUrls,
          };

          // Get the existing user data
          DocumentSnapshot? userData =
              await _firestore.collection('Users').doc(userId).get();

          // ignore: unnecessary_null_comparison
          if (userData != null && userData.exists) {
            // Compare the new values with the existing values
            updatedData.forEach((key, value) {
              if (value == null || value == '') {
                // If the new value is null or empty, keep the existing value
                updatedData[key] = userData[key];
              }
            });

            // Update the Firestore document with the merged data
            await _firestore
                .collection('Users')
                .doc(userId)
                .update(updatedData);

            final successSnackBar = SnackBar(
              content: Text('Changes saved successfully!'),
              duration: Duration(seconds: 2),
            );

            ScaffoldMessenger.of(context).showSnackBar(successSnackBar);
          } else {
            final errorSnackBar = SnackBar(
              content: Text('User data not found'),
              duration: Duration(seconds: 2),
            );

            ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
          }
        } else {
          final errorSnackBar = SnackBar(
            content: Text('Failed to save profile: Invalid input(s)'),
            duration: Duration(seconds: 2),
          );

          ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
        }
      } catch (error) {
        final errorSnackBar = SnackBar(
          content: Text('Failed to save profile: $error'),
          duration: Duration(seconds: 2),
        );

        ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
      }
    } else {
      print('Error: User is not authenticated');
    }
  }

  Widget _buildProfilePicture(String? profilePictureUrl, String? userId) {
    return Padding(
      padding: EdgeInsets.only(top: 0.0),
      child: Stack(
        children: [
          if (profilePictureUrl != null &&
              profilePictureUrl.isNotEmpty &&
              _image == null)
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(profilePictureUrl),
            )
          else if (_image != null)
            CircleAvatar(
              radius: 60,
              backgroundImage: MemoryImage(_image!),
            )
          else
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://www.seekpng.com/png/detail/966-9665493_my-profile-icon-blank-profile-image-circle.png'),
            ),
          Positioned(
            bottom: -10,
            left: 80,
            child: IconButton(
              onPressed: selectImage,
              icon: const Icon(Icons.add_a_photo),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14.0),
        Text(
          '$label:',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.purple[900],
          ),
        ),
        SizedBox(height: 2.0),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildInputCard(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 14.0),
        Text(
          '$label:',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.purple[900],
          ),
        ),
        SizedBox(height: 2.0),
        Container(
          height: 40.0, // Adjust the height as needed
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Enter $label',
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.purple.shade900,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.purple.shade900,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 12.0), // Adjust the horizontal padding as needed
            ),
          ),
        ),
      ],
    );
  }

  bool validatePhoneNumber(String phoneNumber) {
    RegExp regex = RegExp(r'^(09|\+639)\d{9}$');
    if (phoneNumber.startsWith('9')) {
      regex = RegExp(r'^9\d{9}$');
    } else if (phoneNumber.startsWith('09')) {
      regex = RegExp(r'^09\d{9}$');
    }
    return regex.hasMatch(phoneNumber);
  }

  bool validateFacebookLink(String url) {
    RegExp regex = RegExp(
        r'^(https?:\/\/)?(www\.)?(web\.)?facebook\.com\/[a-zA-Z0-9.-_]+\/?$');
    return regex.hasMatch(url);
  }
}
