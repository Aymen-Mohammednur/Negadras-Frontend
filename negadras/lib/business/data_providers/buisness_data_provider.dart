import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:negadras/auth/constants/string.dart';
import 'package:negadras/business/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessDataProvider {
  static final String _baseUrl = "${StringConstants.REST_API_URL}/business";

  static final String _baseUrlFav = "${StringConstants.REST_API_URL}/favorite";

  static final String _baseUrlRec =
      "${StringConstants.REST_API_URL}/recommendation";

  Future<Business> create(Business business) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        },
        body: jsonEncode({
          "name": business.name,
          "categoryId": business.categoryId,
          "location": business.location,
          "averageRating": business.avgRating,
          "phoneNumber": business.phoneNumber,
          "website": business.website,
          "email": business.email,
          "isFavorite": business.isFavorite,
        }));

    print(response.body);
    if (response.statusCode == 201) {
      return Business.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create business");
    }
  }

  Future<List<Business>> fetch() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.get(Uri.parse(_baseUrl),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        });
    print(response.body);
    if (response.statusCode == 200) {
      final business = jsonDecode(response.body) as List;
      return business.map((b) => Business.fromJson(b)).toList();
    } else {
      throw Exception("Failed to get business");
    }
  }

  Future<List<Business>> fetchByCategory(
      String? categoryId, String? userId) async {
    print("Fetch BY Category recieved this");
    print("CategoryId: $categoryId");
    print("UserId: $userId");
    String url;
    print("INSIDE fetchByCategoryfetchByCategoryfetchByCategory");
    if (categoryId != "0") {
      print("searching for category: " + categoryId!);
      url = "$_baseUrl/filter/$categoryId/$userId";
    } else {
      url = "$_baseUrlRec/$userId";
    }

    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    print("Inside business data provider");
    final response = await http.get(Uri.parse(url), headers: <String, String>{
      "Content-Type": "application/json",
      "access-token": token
    });
    // print(response.body);
    if (response.statusCode == 200) {
      final business = jsonDecode(response.body) as List;
      var x = business.map((b) => Business.fromJson(b)).toList();
      return x;
    } else {
      throw Exception("Failed to get business");
    }
  }

  Future<Business> fetchOne(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.get(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        });

    if (response.statusCode == 200) {
      return Business.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get one business");
    }
  }

  Future<Business> update(String id, Business business) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        },
        body: jsonEncode({
          "name": business.name,
          "categoryId": business.categoryId,
          "location": business.location,
          "averageRating": business.avgRating,
          "phoneNumber": business.phoneNumber,
          "website": business.website,
          "email": business.email,
          "isFavorite": business.isFavorite,
        }));

    print(response.body);

    if (response.statusCode == 200) {
      return Business.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update business");
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
      throw Exception("Field to delete the Business");
    }
  }

  Future<List<Business>> fetchForSearch(
      String queryParameter, String? categoryId, String? userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.get(
        Uri.parse(
            "$_baseUrl/search/$categoryId/$userId?queryParameter=$queryParameter"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        });
    print("RESPONSEEEEEEEEEEEEEEE");
    print(
        "$_baseUrl/search/$categoryId/$userId?queryParameter=$queryParameter");
    print(response.body);
    if (response.statusCode == 200) {
      final business = jsonDecode(response.body) as List;
      return business.map((b) => Business.fromJson(b)).toList();
    } else {
      throw Exception("Failed to get business");
    }
  }

  Future<void> addToFavorites(String businessId, String userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    // String query = businessId + userId;
    final response = await http.post(Uri.parse("$_baseUrlFav/"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        },
        body: jsonEncode({"userId": userId, "businessId": businessId}));
    print("ADDED: $response.body");
    if (response.statusCode != 201) {
      throw Exception("Failed to add business to favorites");
    }
  }

  Future<void> removeFromFavorites(String businessId, String userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.delete(
        Uri.parse(
          "$_baseUrlFav/",
        ),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        },
        body: jsonEncode({"userId": userId, "businessId": businessId}));
    print("DELETE: $response.body");
    if (response.statusCode != 204) {
      throw Exception("Failed to delete business to favorites");
    }
  }

  Future<List<Business>> fetchFavorites(String userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;
    final response = await http.get(Uri.parse("$_baseUrl/favorites/$userId"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        });
    if (response.statusCode == 200) {
      final business = jsonDecode(response.body) as List;
      return business.map((b) => Business.fromJson(b)).toList();
    } else {
      throw Exception("Failed to get favorite businesses");
    }
  }
}
