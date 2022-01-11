class LoginResponse {
  final String username;
  final String id;
  final String token;
  final String? role;

  LoginResponse(
      {required this.username,
      required this.id,
      required this.token,
      this.role});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        username: json['username'],
        id: json['id'],
        token: json['token'],
        role: json['role']);
  }
}
