import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:negadras/business/models/models.dart';

class BusinessDataProvider {
  static final String _baseUrl = "http://localhost/3000/Business";

  Future<Business> create(Business business) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "name": business.name,
          "type": business.type,
          "location": business.location,
          "phoneNumber": business.phoneNumber,
          "website": business.website,
          "email": business.email,
          "organization": business.organization,
        }));

    if (response.statusCode == 201) {
      return Business.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create business");
    }
  }

  Future<List<Business>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final business = jsonDecode(response.body) as List;
      return business.map((b) => Business.fromJson(b)).toList();
    } else {
      throw Exception("Failed to get business");
    }
  }

  Future<Business> fetchOne(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));

    if (response.statusCode == 200) {
      return Business.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get one business");
    }
  }

  Future<Business> update(String id, Business business) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "_id": id,
          "name": business.name,
          "type": business.type,
          "location": business.location,
          "phoneNumber": business.phoneNumber,
          "website": business.website,
          "email": business.email,
          "organization": business.organization,
        }));

    if (response.statusCode == 200) {
      return Business.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update business");
    }
  }

  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the Business");
    }
  }
}