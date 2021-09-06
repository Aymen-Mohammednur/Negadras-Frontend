class Register{
  final String username;
  final String password;
  final String role;
  Register({required this.username, required this.password,required this.role});

  List<Object> get props => [username,password,role];

  factory Register.fromJson(Map<String,dynamic> json){
      return Register(username: json['username'],password: json['password'],role: json['roles']);
  }

  @override
  String toString()=> 'User {username: $username} role: $role';
}