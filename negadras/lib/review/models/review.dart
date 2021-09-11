import 'dart:convert';

class Review {
  late String userId;
  final String id;
  final String businessId;
  final int rating;
  final String? reviewText;
  late final String? username;

  Review({
    required this.userId,
    required this.id,
    required this.businessId,
    required this.rating,
    required this.username,
    this.reviewText,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    Review r = Review(
      username: json["username"],
      id: json["_id"],
      userId: json['userId'],
      businessId: json['businessId'],
      rating: int.parse(json['rating']),
      reviewText: json['reviewText'] ?? " ",
    );

    return r;
  }
  // JsonCodec toJson(){
  //   return json.decode('{"userId": "${this.userId}", "businessId": "${this.businessId}", "rating": "${this.rating}", "reviewText": "${this.reviewText}", "userName": "${this.reviewText}"');
  // }
}
