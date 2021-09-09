import 'dart:convert';
import 'package:negadras/auth/Constants/constants.dart';
import 'package:negadras/auth/models/models.dart';
import 'package:http/http.dart' as http;

class AuthDataProvider {
  static final String _baseUrl = "${StringConstants.BASE_URL_EMULATOR}/auth";
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
    if (response.statusCode == 200) {
      return Register.fromJson(jsonDecode(response.body));
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
        StringConstants.USERNAME: login.username,
        StringConstants.PASSWORD: login.password
      }),
    );

    if (response.statusCode == 200) {
      return Login.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to login user");
    }
  }
}
