part of 'user_bloc.dart';

// import 'package:equatable/equatable.dart';
// import 'package:negadras/user/models/user.dart';

class UserState {
  final String username;
  bool get isValidUsername => username.length > 5;

  final String password;
  bool get isValidPassword => password.length > 6;

  final String newPassword;
  bool get isValidNewPassword => newPassword.length > 6;

  final String confirmPassword;
  bool get isValidConfirmPassword => confirmPassword == newPassword;

  final FormSubmissionStatus formStatus;

  UserState(
      {this.username = '',
      this.password = '',
      this.newPassword = '',
      this.confirmPassword = '',
      this.formStatus = const InitialFormStatus()});

  UserState copyWith({
    String? username,
    String? password,
    String? newPassword,
    String? confirmPassword,
    FormSubmissionStatus? formStatus,
  }) {
    return UserState(
      username: username ?? this.username,
      password: password ?? this.password,
      newPassword: password ?? this.newPassword,
      confirmPassword: password ?? this.confirmPassword,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
