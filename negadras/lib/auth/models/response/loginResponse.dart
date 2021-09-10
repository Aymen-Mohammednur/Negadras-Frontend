class LoginResponse {
  final String username;
  final String id;
  final String token;

  LoginResponse(
      {required this.username, required this.id, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        username: json['username'], id: json['id'], token: json['token']);
  }
}
