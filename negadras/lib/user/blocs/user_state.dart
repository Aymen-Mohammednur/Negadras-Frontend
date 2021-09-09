part of 'user_bloc.dart';

// import 'package:equatable/equatable.dart';
// import 'package:negadras/user/models/user.dart';

class UserState {
  final String username;
  bool get isValidUsername => username.length > 5;

  final String password;
  bool get isValidPassword => password.length > 6;
  final FormSubmissionStatus formStatus;

  UserState(
      {this.username = '',
      this.password = '',
      this.formStatus = const InitialFormStatus()});

  UserState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return UserState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
