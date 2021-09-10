// import 'package:equatable/equatable.dart';
// import 'package:negadras/user/models/user.dart';
part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUser extends UserEvent {
  final String userId;
  LoadUser({required this.userId});
}

class UpdateUsername extends UserEvent {
  final String username;

  const UpdateUsername({required this.username});

  @override
  // List<Object> get props => [user];

  @override
  String toString() => 'Username Updated {username: $username}';
}

class UpdatePassword extends UserEvent {
  final String password;

  const UpdatePassword({required this.password});

  @override
  // List<Object> get props => [userId];

  @override
  String toString() => 'Password Updated';
}

class DeleteUser extends UserEvent {
  final String userid;

  const DeleteUser( {required this.userid});

  @override
  List<Object> get props => [userid];

  @override
  toString() => 'User Deleted {user Id: $userid}';
}
class UserSubmitted extends UserEvent {
  UserSubmitted();
}