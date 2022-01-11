import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:negadras/auth/constants/constants.dart';
import 'package:negadras/organization/models/organization_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrganizationDataProvider {
  // FOR ACTUAL DEVICE
  //static final String _baseUrl = "http://localhost:3000/api/organization";
  // FOR EMULATOR
  // static final String _baseUrl = "http://10.0.2.2:3000/api/organization";
  static final String _baseUrl =
      "${StringConstants.BASE_URL_EMULATOR}/organization";

  Future<Organization> create(String userId, Organization organization) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        },
        body: jsonEncode({"name": organization.name, "userId": userId}));

    if (response.statusCode == 201) {
      return Organization.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create Organization");
    }
  }

  Future<List<Organization>> fetchByUserId(String userId) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    // print("Inside data provider");
    final response = await http.get(Uri.parse("$_baseUrl/$userId"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        });
    // print(response.body);
    // print(response.statusCode);

    if (response.statusCode == 200) {
      final organization = jsonDecode(response.body) as List;
      return organization.map((c) => Organization.fromJson(c)).toList();
    } else if (response.statusCode == 404) {
      return [];
    } else {
      throw Exception("Failed to get Organization");
    }
  }

  Future<Organization> fetchOne(String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.get(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        });

    if (response.statusCode == 200) {
      return Organization.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get one Organization");
    }
  }

  Future<Organization> update(String id, Organization organization) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = pref.getString("token") as String;

    final response = await http.patch(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "access-token": token
        },
        body: jsonEncode({
          "name": organization.name,
        }));

    if (response.statusCode == 200) {
      return Organization.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update Organization");
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
      throw Exception("Field to delete the Organization");
    }
  }
}
