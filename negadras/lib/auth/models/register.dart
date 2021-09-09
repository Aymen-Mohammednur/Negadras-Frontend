class Register {
  final String username;
  final String password;
  final String firstname;
  final String lastname;
  Register(
      {required this.username,
      required this.password,
      required this.firstname,
      required this.lastname});

  List<Object> get props => [username, password, firstname, lastname];

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
        username: json['username'],
        password: json['password'],
        firstname: json['firstName'],
        lastname: json['lastName']);
  }

  @override
  String toString() => 'User {username: $username}';
}
