import 'dart:convert';
import 'package:negadras/buisness/models/buisness.dart';
import 'package:http/http.dart' as http;

class BuisnessDataProvider {
  static final String _baseUrl = "http://localhost/3000/buisness";

  Future<Buisness> create(Buisness buisness) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "name": buisness.name,
          "type": buisness.type,
          "location": buisness.location,
          "phoneNumber": buisness.phoneNumber,
          "website": buisness.website,
          "email": buisness.email,
          "organization": buisness.organization,
        }));

    if (response.statusCode == 201) {
      return Buisness.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create business");
    }
  }

  Future<List<Buisness>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final business = jsonDecode(response.body) as List;
      return business.map((b) => Buisness.fromJson(b)).toList();
    } else {
      throw Exception("Failed to get business");
    }
  }

  Future<Buisness> fetchOne(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));

    if (response.statusCode == 200) {
      return Buisness.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get one business");
    }
  }

  Future<Buisness> update(String id, Buisness buisness) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "_id": id,
          "name": buisness.name,
          "type": buisness.type,
          "location": buisness.location,
          "phoneNumber": buisness.phoneNumber,
          "website": buisness.website,
          "email": buisness.email,
          "organization": buisness.organization,
        }));

    if (response.statusCode == 200) {
      return Buisness.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update business");
    }
  }

  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the buisness");
    }
  }
}
