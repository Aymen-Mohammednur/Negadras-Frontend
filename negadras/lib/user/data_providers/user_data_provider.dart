import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:negadras/user/models/models.dart';
import 'package:negadras/auth/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider {
  // static final String _baseUrl = "http://localhost/3000/api/user";

  // FOR EMULATOR
  static final String _baseUrl = "${StringConstants.REST_API_URL}/user";

  Future<User> fetchOne(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.get(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        });

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get user information");
    }
  }

  Future<User> updateUsername(String id, String username) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.patch(Uri.parse("$_baseUrl/username/$id"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        },
        body: jsonEncode({
          "username": username,
          // "role": user.role,
        }));
    print(response.body);
    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update username");
    }
  }

  Future<User> changePassword(
      String id, String oldPassword, String newPassword) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.patch(Uri.parse("$_baseUrl/password/$id"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        },
        body: jsonEncode(
          {"oldPassword": oldPassword, "newPassword": newPassword},
        ));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update password");
    }
  }

  Future<void> delete(String id, String password) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.delete(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        },
        body: jsonEncode({
          "password": password
          // "role": user.role,
        }));

    if (response.statusCode != 204) {
      throw Exception("Field to delete the user");
    }
  }

  Future<void> makeClaim(String userId, String businessId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.post(Uri.parse("$_baseUrl/claim"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        },
        body: jsonEncode({
          "userId": userId,
          "businessId": businessId
          // "role": user.role,
        }));

    if (response.statusCode == 404) {
      throw Exception("Field to clai the user");
    }
  }
}
