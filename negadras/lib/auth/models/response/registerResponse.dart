class RegisterResponse {
  final String username;
  final String firstname;
  final String lastname;
  final String id;
  RegisterResponse(
      {required this.username,
      required this.firstname,
      required this.lastname,
      required this.id});

  List<Object> get props => [username, id, firstname, lastname];

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
        username: json['username'],
        id: json['_id'],
        firstname: json['firstName'],
        lastname: json['lastName']);
  }

  @override
  String toString() => 'User {username: $username}';
}
