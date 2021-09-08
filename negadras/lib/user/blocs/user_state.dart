// part of 'business_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:negadras/user/models/user.dart';

abstract class UserState extends Equatable {
  const UserState();

  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final User user;
  UserLoaded(this.user);
}

class UserOperationSuccess extends UserState {
  final Iterable<User> user;

  UserOperationSuccess([this.user = const []]);

  @override
  List<Object> get props => [user];
}

class UserOperationFailure extends UserState {}
