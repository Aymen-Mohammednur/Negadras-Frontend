import 'package:equatable/equatable.dart';
import 'package:negadras/user/models/user.dart';
// part of 'user_bloc.dart';

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
  final User user;

  const UpdateUsername(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'username Updated {username: $user}';
}

class UpdatePassword extends UserEvent {
  final User userId;

  const UpdatePassword(this.userId);

  @override
  List<Object> get props => [userId];

  @override
  String toString() => 'password Updated {user: $userId}';
}

class DeleteUser extends UserEvent {
  final String userid;

  const DeleteUser(this.userid);

  @override
  List<Object> get props => [userid];

  @override
  toString() => 'User Deleted {user Id: $userid}';
}
