part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class SignUpFirstnameChanged extends SignUpEvent {
  final String firstname;

  SignUpFirstnameChanged({required this.firstname});
}

class SignUpLastnameChanged extends SignUpEvent {
  final String lastname;

  SignUpLastnameChanged({required this.lastname});
}

class SignUpUsernameChanged extends SignUpEvent {
  final String username;

  SignUpUsernameChanged({required this.username});
}

class SignUpEmailChanged extends SignUpEvent {
  final String email;

  SignUpEmailChanged({required this.email});
}

class SignUpPasswordChanged extends SignUpEvent {
  final String password;

  SignUpPasswordChanged({required this.password});
}

class SignUpConfirmPasswordChanged extends SignUpEvent {
  final String confirmPassword;

  SignUpConfirmPasswordChanged({required this.confirmPassword});
}

class SignUpSubmitted extends SignUpEvent {}
