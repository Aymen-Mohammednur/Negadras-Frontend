import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:negadras/user/models/models.dart';
import 'package:negadras/auth/constants/constants.dart';

class UserDataProvider {
  // static final String _baseUrl = "http://localhost/3000/api/user";

  // FOR EMULATOR
  static final String _baseUrl = "${StringConstants.BASE_URL_EMULATOR}/user";

  Future<User> fetchOne(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get user information");
    }
  }

  Future<User> updateUsername(String id, String username) async {
    final response = await http.patch(Uri.parse("$_baseUrl/username/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
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
    final response = await http.patch(Uri.parse("$_baseUrl/password/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
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
    final response = await http.delete(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "password": password
          // "role": user.role,
        }));

    if (response.statusCode != 204) {
      throw Exception("Field to delete the user");
    }
  }

  Future<void> makeClaim(String userId, String businessId) async {
    final response = await http.post(Uri.parse("$_baseUrl/claim"),
        headers: <String, String>{"Content-Type": "application/json"},
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
