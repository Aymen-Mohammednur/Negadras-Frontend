import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:negadras/user/models/models.dart';

class UserDataProvider {
  static final String _baseUrl = "http://localhost/3000/User";

  Future<User> fetch(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get user information");
    }
  }
  Future<User> update(String id, User user) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          // "firstName": user.firstName,
          // "lastName": user.lastName,
          "username": user.username,
          "password": user.password,
          // "role": user.role,
        }));

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update username or password");
    }
  }

}
