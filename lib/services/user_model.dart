class UserModel {
  final String? id;
  final String userName;
  final String email;
  final String password;
  final String? profilePictureUrl;
  final String? phoneNumber;
  final String? facebookLink;
  final String? businessInformation;
  final String? address;
  final List<String> certificationImageUrls;

  UserModel({
    this.id,
    required this.userName,
    required this.email,
    required this.password,
    this.profilePictureUrl,
    this.phoneNumber,
    this.facebookLink,
    this.businessInformation,
    this.address,
    List<String>? certificationImageUrls,
  }) : certificationImageUrls = certificationImageUrls ?? [];

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "userName": userName,
      "email": email,
      "password": password,
      "profilePictureUrl": profilePictureUrl,
      "phoneNumber": phoneNumber,
      "facebookLink": facebookLink,
      "businessInformation": businessInformation,
      "address": address,
      "certificationImageUrls": certificationImageUrls,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userName: json['userName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      profilePictureUrl: json['profilePictureUrl'],
      phoneNumber: json['phoneNumber'],
      facebookLink: json['facebookLink'],
      businessInformation: json['businessInformation'],
      address: json['address'],
      certificationImageUrls:
          List<String>.from(json['certificationImageUrls'] ?? []),
    );
  }

  // Add this method to convert the model to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
    };
  }

  // Add this factory method to create a model from a JSON map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'] ?? '',
      email: '',
      password: '',
    );
  }
}
