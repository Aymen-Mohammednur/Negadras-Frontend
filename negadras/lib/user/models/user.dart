class User {
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String? password;
  final String role;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    this.password,
    required this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      username: json['username'],
      password: json['password'],
      role: json['role'],
    );
  }
}
