import 'dart:convert';

import 'package:ecommerce/features/auth/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  final String _tokenKey = 'token';
  final String _userDataKey = 'user-data';

  String? token;
  UserModel? user;

  Future<void> saveUserData(String accessToken, UserModel userModel) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(_tokenKey, accessToken);
    await sharedPreferences.setString(_userDataKey, jsonEncode(userModel.toJson()));

    token = accessToken;
    user = userModel;
  }

  Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString(_tokenKey);
    String? userData = sharedPreferences.getString(_userDataKey);
    if (userData != null) {
      user = UserModel.fromJson(jsonDecode(userData));
    }
  }

  Future<bool> isUserLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? accessToken = sharedPreferences.getString(_tokenKey);
    if (accessToken != null) {
      await getUserData();
      return true;
    }
    return false;
  }

  Future<void> clearUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    token = null;
    user = null;
  }

  bool isValidUser() {
    return token != null;
  }
}
