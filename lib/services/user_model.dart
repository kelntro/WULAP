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

  // New properties
  final String? menuItem;
  final String? category;
  final String? datePosted;
  final String? link;

  bool isValid() {
    return menuItem != null &&
        category != null &&
        datePosted != null &&
        link != null &&
        menuItem!.isNotEmpty &&
        category!.isNotEmpty &&
        datePosted!.isNotEmpty &&
        link!.isNotEmpty;
  }

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
    this.menuItem,
    this.category,
    this.datePosted,
    this.link,
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
      "menuItem": menuItem,
      "category": category,
      "datePosted": datePosted,
      "link": link,
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
      menuItem: json['menuItem'],
      category: json['category'],
      datePosted: json['datePosted'],
      link: json['link'],
    );
  }

  // Add this method to convert the model to a JSON map
  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'menuItem': menuItem ?? '', // Add other properties as needed
      'category': category ?? '',
      'datePosted': datePosted ?? '',
      'link': link ?? '',
    };
  }

  // Add this factory method to create a model from a JSON map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      userName: map['userName'] ?? '',
      menuItem: map['menuItem'] ?? '',
      category: map['category'] ?? '',
      datePosted: map['datePosted'] ?? '',
      link: map['link'] ?? '',
      email: '',
      password: '',
    );
  }
}
