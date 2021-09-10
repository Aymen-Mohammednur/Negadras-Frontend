import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:negadras/business/models/models.dart';

class BusinessDataProvider {
  // FOR ACTUAL DEVICE
  //static final String _baseUrl = "http://localhost:3000/api/category";
  // FOR EMULATOR
  static final String _baseUrl = "http://10.0.2.2:3000/api/business";

  Future<Business> create(Business business) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "name": business.name,
          "categoryId": business.categoryId,
          "location": business.location,
          "phoneNumber": business.phoneNumber,
          "website": business.website,
          "email": business.email,
        }));

    // print(response.body);
    if (response.statusCode == 201) {
      return Business.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create business");
    }
  }

  Future<List<Business>> fetch() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final business = jsonDecode(response.body) as List;
      return business.map((b) => Business.fromJson(b)).toList();
    } else {
      throw Exception("Failed to get business");
    }
  }

  Future<List<Business>> fetchByCategory(String? categoryId) async {
    print("Inside business data provider");
    final response = await http.get(Uri.parse("$_baseUrl/filter/$categoryId"));
    // print(response.body);
    if (response.statusCode == 200) {
      final business = jsonDecode(response.body) as List;
      // print(business);
      // final test = business.map((b) => Business.fromJson(b)).toList();
      // print(test[0].name);
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
          "name": business.name,
          "categoryId": business.categoryId,
          "location": business.location,
          "phoneNumber": business.phoneNumber,
          "website": business.website,
          "email": business.email,
        }));

    print(response.body);

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

  Future<void> addToFavorites(String businessId, String userId) async {
    String query = businessId + userId;
    final response = await http.post(Uri.parse("$_baseUrl/Favorites/?$query"));
    if (response.statusCode != 204) {
      throw Exception("Failed to add business to favorites");
    }
  }

  Future<void> removeFromFavorites(String businessId, String userId) async {
    String query = businessId + userId;
    final response =
        await http.delete(Uri.parse("$_baseUrl/Favorites/?$query"));
    if (response.statusCode != 204) {
      throw Exception("Failed to delete business to favorites");
    }
  }
}
