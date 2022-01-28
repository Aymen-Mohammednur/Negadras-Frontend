import 'dart:convert';
import 'package:negadras/review/models/review.dart';
import 'package:http/http.dart' as http;
import 'package:negadras/auth/constants/constants.dart';

class ReviewDataProvider {
  static final String _baseUrl = "${StringConstants.REST_API_URL}/review";

  Future<Review> create(Review review) async {
    // print("Inside data provider");
    // print("review: ${review.userId}");
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode({
          "userId": review.userId,
          "businessId": review.businessId,
          "rating": review.rating.toString(),
          "reviewText": review.reviewText ?? "",
        }));
    // print(response.body);
    if (response.statusCode == 201) {
      return Review.fromJson(jsonDecode(response.body));
    } else {
      // print("Http response failed");
      throw Exception("Failed to create review");
    }
  }

  // Fetch all reviews for a business
  Future<List<Review>> fetchAll(String businessId) async {
    // print("Reached here");
    final response = await http.get(Uri.parse("$_baseUrl/$businessId"));
    // print("Response is here");
    // print("$_baseUrl/$businessId");
    // print(response.body);
    if (response.statusCode == 200) {
      final reviews = jsonDecode(response.body) as List;
      var a =
          reviews.map((singleReview) => Review.fromJson(singleReview)).toList();
      return a;
    } else {
      throw Exception("Failed to get reviews");
    }
  }

  Future<Review> fetchOne(String businessId, String username) async {
    final response =
        await http.get(Uri.parse("$_baseUrl/$businessId/$username"));

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
          "userId": review.userId,
          "businessId": review.businessId,
          "rating": review.rating,
          "reviewText": review.reviewText,
        }));

    if (response.statusCode == 200) {
      return Review.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to update review");
    }
  }

  Future<void> delete(String businessId, String userId) async {
    final response =
        await http.delete(Uri.parse("$_baseUrl/$businessId/$userId"));
    if (response.statusCode != 204) {
      throw Exception("Field to delete the review");
    }
  }
}
