import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/user_model.dart';

class AuthController extends GetxController {
  final String _userDataKey = 'user-data';
  final String _tokenKey = 'token';

  UserModel? userModel;
  String? accessToken;

  Future<void> saveUserData(String token, UserModel model) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String jsonString = jsonEncode(model.toJson());
    await sharedPreferences.setString(_userDataKey, jsonString);
    await sharedPreferences.setString(_tokenKey, token);
    userModel = model;
    accessToken = token;

    print('User saved: $userModel'); // Print the saved JSON (for debugging)
  }

  Future<void> getUserData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userData = sharedPreferences.getString(_userDataKey);
    String? tokenData = sharedPreferences.getString(_tokenKey);
    if (userData != null) {
      userModel = UserModel.fromJson(jsonDecode(userData));
      accessToken = tokenData;

      print('User retrieved: ${userModel?.toString()}');
    }
  }

  Future<bool> isUserLoggedIn() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? tokenData = sharedPreferences.getString(_tokenKey);
    if (tokenData != null) {
      await getUserData();
      return true;
    }
    return false;
  }

  Future<void> clearUserData() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
    accessToken = null;
    userModel = null;
  }
}
