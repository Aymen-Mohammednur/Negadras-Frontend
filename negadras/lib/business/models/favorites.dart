class Favorites {
  final String id;
  final String userId;
  final String businessId;

  Favorites({
    required this.id,
    required this.userId,
    required this.businessId,
  });

  factory Favorites.fromJson(Map<String, dynamic> json) {
    return Favorites(
      id: json['_id'],
      userId: json['_userId'],
      businessId: json['_businessId'],
    );
  }
}
