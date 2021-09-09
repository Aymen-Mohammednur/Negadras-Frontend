class RegisterResponse {
  final String username;
  final String password;
  final String firstname;
  final String lastname;
  RegisterResponse(
      {required this.username,
      required this.password,
      required this.firstname,
      required this.lastname});

  List<Object> get props => [username, password, firstname, lastname];

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
        username: json['username'],
        password: json['password'],
        firstname: json['firstname'],
        lastname: json['lastname']);
  }

  @override
  String toString() => 'User {username: $username}';
}
