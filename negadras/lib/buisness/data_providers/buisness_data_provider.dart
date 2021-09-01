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
    }
    {
      throw Exception("Failed to create business");
    }
  }
}
