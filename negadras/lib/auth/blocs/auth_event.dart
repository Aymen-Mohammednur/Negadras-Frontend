import 'package:negadras/auth/models/models.dart';
import 'package:equatable/equatable.dart';

// logging in stuff
abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginNormal extends LoginEvent{
  const LoginNormal();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Normal Login Screen';
}

class LoginRead extends LoginEvent {
  final Login login;

  const LoginRead(this.login);

  @override
  List<Object> get props => [login];

  @override
  String toString() => 'Logged In {username: $login.username}';
}

// Register Stuff

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class RegisterNormal extends RegisterEvent{
  const RegisterNormal();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'Normal Register Screen';
}

class RegisterCreate extends RegisterEvent {
  final Register register;

  const RegisterCreate(this.register);

  @override
  List<Object> get props => [register];

  @override
  String toString() => 'Registered {username: $register.username}';
}
