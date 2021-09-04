import 'dart:convert';
import 'package:negadras/review/models/review.dart';
import 'package:http/http.dart' as http;

class BuisnessDataProvider {
  static final String _baseUrl = "http://localhost/3000/review";

  Future<Review> create(Review review) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id": review.id,
          "userId": review.userId,
          "businessId": review.businessId,
          "rating": review.rating,
          "reviewText": review.reweiwText,
        }));

    if (response.statusCode == 201) {
      return Review.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create business");
    }
  }

  Future<List<Review>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final review = jsonDecode(response.body) as List;
      return review.map((b) => Review.fromJson(b)).toList();
    } else {
      throw Exception("Failed to get reviews");
    }
  }

  Future<Review> fetchOne(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl/$id"));

    if (response.statusCode == 200) {
      return Review.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to get one review");
    }
  }

  Future<Review> update(String id, Review review) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "id": review.id,
          "userId": review.userId,
          "businessId": review.businessId,
          "rating": review.rating,
          "reviewText": review.reweiwText,
        }));

    if (response.statusCode == 200) {
      return Review.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update review");
    }
  }

  Future<void> delete(String id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the review");
    }
  }
}
