import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:negadras/category/models/category.dart';

class CategoryDataProvider {
  // FOR ACTUAL DEVICE
  //static final String _baseUrl = "http://localhost:3000/api/category";
  // FOR EMULATOR
  static final String _baseUrl = "http://10.0.2.2:8000/api/category";


  Future<Category> create(Category category) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
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
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final category = jsonDecode(response.body) as List;
      return category.map((c) => Category.fromJson(c)).toList();
    } else {
      throw Exception("Failed to get category");
    }
  }

  Future<Category> fetchOne(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));

    if (response.statusCode == 200) {
      return Category.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get one category");
    }
  }

  Future<Category> update(String id, Category category) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
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
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the category");
    }
  }
}
