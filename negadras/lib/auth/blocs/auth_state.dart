import 'package:negadras/auth/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginNormalWaiting extends LoginState{}

class LoginOperationSuccess extends LoginState {
  final Login login;

  LoginOperationSuccess(this.login);

  @override
  List<Object> get props => [login];
}

class LoginOperationFailure extends LoginState {}

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterNormalWaiting extends RegisterState {}

class RegisterOperationSuccess extends RegisterState {
  final Register register;

  RegisterOperationSuccess(this.register);

  @override
  List<Object> get props => [register];
}

class RegisterOperationFailure extends RegisterState {}