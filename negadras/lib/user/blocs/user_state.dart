part of 'user_bloc.dart';

// import 'package:equatable/equatable.dart';
// import 'package:negadras/user/models/user.dart';

class UserInitial extends UserState {}
class Fetching extends UserState {}
class UserProfile extends UserState {}

abstract class UserState extends Equatable {
  const UserState();

  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);
}

class UserOperationSuccess extends UserState {
  // UserOperationSuccess(user);
  // final Iterable<User> user;
  

  // UserOperationSuccess([this.user = const []]);

  @override
  List<Object> get props => [];
}

class UserOperationFailure extends UserState {}
