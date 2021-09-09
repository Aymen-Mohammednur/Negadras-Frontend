import 'dart:convert';
import 'package:negadras/auth/Constants/constants.dart';
import 'package:negadras/auth/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataProvider {
  static final String _baseUrl = "${StringConstants.BASE_URL_DEVICE}/auth";
  final Future<SharedPreferences> _prefs = SharedPreferences?.getInstance();

  http.Client client;

  AuthDataProvider(this.client);

  Future<Register> createRegister(Register register) async {
    final http.Response response =
        await client.post(Uri.parse("$_baseUrl/register"),
            headers: <String, String>{"Content-Type": "application/json"},
            body: jsonEncode({
              "username": register.username,
              "password": register.username,
              "firstName": register.firstname,
              "lastName": register.lastname
            }));

    print("Status Code: ${response.statusCode}");
    if (response.statusCode == 200) {
      print("resonse body signup ${response.body}");

      final SharedPreferences prefs = await _prefs;
      var signUpRes = jsonDecode(response.body);

      print("user_id signup ${signUpRes["_id"]}");
      await prefs.setString("user_id", signUpRes["_id"]);

      return Register.fromJson(signUpRes);
    }
    {
      throw Exception("Failed to register user");
    }
  }

  Future<Login> readLogin(Login login) async {
    final http.Response response = await client.post(
      Uri.parse("$_baseUrl/login"),
      headers: <String, String>{"Content-Type": "application/json"},
      body: jsonEncode({
        "username": login.username,
        "password": login.password
      }),
    );
    print("Status Code: ${response.statusCode}");
    if (response.statusCode == 200) {
      final SharedPreferences prefs = await _prefs;
      print("resonse body login ${response.body}");
      var res = jsonDecode(response.body);

      await prefs.setString("user_id",res["id"]);
      await prefs.setString("token",res["token"]);
      return Login.fromJson(res);
    }
    {
      throw Exception("Failed to login user");
    }
  }
}
