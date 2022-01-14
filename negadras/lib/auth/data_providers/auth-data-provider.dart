import 'dart:convert';
import 'package:negadras/auth/constants/constants.dart';
import 'package:negadras/auth/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:negadras/auth/models/response/loginResponse.dart';
import 'package:negadras/auth/models/response/registerResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthDataProvider {
  static final String _baseUrl = "${StringConstants.REST_API_URL}/auth";

  http.Client client;

  AuthDataProvider(this.client);

  Future<RegisterResponse> createRegister(Register register) async {
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
      var signUpRes = jsonDecode(response.body);

      return RegisterResponse.fromJson(signUpRes);
    }
    {
      throw Exception("Failed to register user");
    }
  }

  Future<LoginResponse> readLogin(Login login) async {
    final http.Response response = await client.post(
      Uri.parse("$_baseUrl/login"),
      headers: <String, String>{"Content-Type": "application/json"},
      body:
          jsonEncode({"username": login.username, "password": login.password}),
    );
    print("Status Code: ${response.statusCode}");
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      return LoginResponse.fromJson(res);
    }
    {
      throw Exception("Failed to login user");
    }
  }
}
