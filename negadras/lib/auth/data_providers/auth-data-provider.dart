import 'dart:convert';
import 'package:negadras/auth/models/models.dart';
import 'package:http/http.dart' as http;
import 'package:negadras/constants/constants.dart';

class AuthDataProvider {
  static final String _baseUrl = StringConstants.BASE_URL;

  Future<Register> createRegister(Register register) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "username": register.username,
          "password": register.username,
          "role": register.username,
        }));

    if (response.statusCode == 201) {
      return Register.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to register user");
    }
  }

  Future<Login> readLogin(Login login) async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return Login.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Couldn't login. Check your credintials");
    }
  }
}
