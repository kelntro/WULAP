import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserModel {
  late String userName;

  UserModel({required this.userName});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userName: json['userName'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
    };
  }

  // Add this method to convert the model from a map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(userName: map['userName'] ?? '');
  }
}

class UserDataProvider with ChangeNotifier {
  late UserModel _user;
  UserModel get user => _user;

  UserDataProvider() : _user = UserModel(userName: '');

  Future<void> init() async {
    await _loadUserData();
  }

  Future<void> _loadUserData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = prefs.getString('userData');

      if (userJson != null && userJson.isNotEmpty) {
        final userMap = json.decode(userJson);
        _user = UserModel.fromJson(userMap);
        notifyListeners();
      }
    } catch (e) {
      print('Error loading user data: $e');
    }
  }

  Future<void> saveUserData(UserModel user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final userJson = json.encode(user.toJson());
      await prefs.setString('userData', userJson);
      _user = user;
      notifyListeners();
      print('User data saved: $userJson');
    } catch (e) {
      print('Error saving user data: $e');
    }
  }

  Future<void> clearUserData() async {
    try {
      _user = UserModel(userName: ''); // Set to default or empty user
      notifyListeners();

      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('userData');
    } catch (e) {
      print('Error clearing user data: $e');
    }
  }
}
