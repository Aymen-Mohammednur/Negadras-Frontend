class Business {
  final String id;
  final String name;
  final String categoryId;
  final String location;
  final String? phoneNumber;
  final String? website;
  final String? email;
  final String? organization;

  Business(
      {required this.id,
      required this.name,
      required this.categoryId,
      required this.location,
      this.phoneNumber,
      this.website,
      this.email,
      this.organization});

  factory Business.fromJson(Map<String, dynamic> json) {
    return Business(
        id: json['_id'],
        name: json['name'],
        categoryId: json['categoryId'],
        location: json['location'],
        phoneNumber: json['phoneNumber'],
        website: json['website'],
        email: json['email'],
        organization: json['organizationId']);
  }
}
