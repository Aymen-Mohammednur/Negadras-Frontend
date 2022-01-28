class Register {
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  Register(
      {required this.username,
      required this.password,
      required this.firstName,
      required this.lastName});

  List<Object> get props => [username, password, firstName, lastName];

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
        username: json['username'],
        password: json['password'],
        firstName: json['firstName'],
        lastName: json['lastName']);
  }

  @override
  String toString() => 'User {username: $username}';
}
