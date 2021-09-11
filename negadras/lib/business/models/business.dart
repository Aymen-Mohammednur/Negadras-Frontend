class Business {
  final String id;
  final String name;
  final String categoryId;
  final String location;
  final double? avgRating;
  final String? phoneNumber;
  final String? website;
  final String? email;
  final String? organization;
  final bool? isFavorite;

  Business(
      {required this.id,
      required this.name,
      required this.categoryId,
      required this.location,
      required this.avgRating,
      this.phoneNumber,
      this.website,
      this.email,
      this.organization,
      this.isFavorite});

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
        id: json['_id'],
        name: json['name'],
        categoryId: json['categoryId'],
        location: json['location'],
        avgRating: json['averageRating'],
        phoneNumber: json['phoneNumber'],
        website: json['website'],
        email: json['email'],
        organization: json['organizationId'],
        isFavorite: json['isFavorite']);
  }
}
