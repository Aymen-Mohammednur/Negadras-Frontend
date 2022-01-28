import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:negadras/auth/constants/string.dart';
import 'package:negadras/category/models/category.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryDataProvider {
  static final String _baseUrl = "${StringConstants.REST_API_URL}/category";

  Future<Category> create(Category category) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        },
        body: jsonEncode({
          "name": category.name,
        }));

    if (response.statusCode == 201) {
      return Category.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create category");
    }
  }

  Future<List<Category>> fetchAll() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;
    // // print("Inside data provider");
    final response = await http.get(Uri.parse(_baseUrl),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        });
    // // print(response.body);
    // // print(response.statusCode);

    if (response.statusCode == 200) {
      final category = jsonDecode(response.body) as List;
      return category.map((c) => Category.fromJson(c)).toList();
    } else {
      throw Exception("Failed to get category");
    }
  }

  Future<Category> fetchOne(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.get(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        });

    if (response.statusCode == 200) {
      return Category.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get one category");
    }
  }

  Future<Category> update(String id, Category category) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        },
        body: jsonEncode({
          "_id": id,
          "name": category.name,
        }));

    if (response.statusCode == 200) {
      return Category.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update category");
    }
  }

  Future<void> delete(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.delete(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        });
    if (response.statusCode != 204) {
      throw Exception("Field to delete the category");
    }
  }
}
