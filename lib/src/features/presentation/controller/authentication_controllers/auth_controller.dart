import 'dart:convert';
import 'package:craftybay/src/features/data/models/user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final String _userKey = 'user';
  final String _tokenKey = 'token';
  UserModel? userModel;
  String? accessToken;

  Future<void> saveUserData(UserModel model, String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(model.toJson()));
    await prefs.setString(_tokenKey, token);
    accessToken = token;
    userModel = model;
  }

  Future<void> getUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString(_userKey);
    String? token = prefs.getString(_tokenKey);
    if (userData != null) {
      userModel = jsonDecode(userData);
      accessToken = token;
    }
  }

  Future<void> clearUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    userModel = null;
    accessToken = null;
  }

  Future<bool> isLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? tokenData = prefs.getString(_tokenKey);
    if (tokenData != null) {
      await getUserData();
      return true;
    }
    return false;
  }
}