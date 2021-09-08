class Login {
  final String username;
  final String password;

  Login({required this.username, required this.password});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(username: json['username'], password: json['password']);
  }
}
