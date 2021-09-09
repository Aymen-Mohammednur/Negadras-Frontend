import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:negadras/user/models/models.dart';

class UserDataProvider {
  static final String _baseUrl = "http://localhost/3000/User";

  Future<User> fetchOne(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get user information");
    }
  }

  Future<User> updateUsername(String id, String username) async {
    final response = await http.patch(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          // "firstName": user.firstName,
          // "lastName": user.lastName,
          "id": id,
          "username": username,
          // "role": user.role,
        }));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update username");
    }
  }

  Future<User> changePassword(String id, String password) async {
    final response = await http.patch(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id": id,
          "password": password,
        }));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update password");
    }
  }

  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the user");
    }
  }
}
