class Review {
  final String id;
  final String userId;
  final String businessId;
  final int rating;
  final String? reweiwText;

  Review({
    required this.id,
    required this.userId,
    required this.businessId,
    required this.rating,
    this.reweiwText,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'],
      userId: json['userId'],
      businessId: json['businessId'],
      rating: json['rating'],
      reweiwText: json['reviewText'],
    );
  }
}
