part of 'sign_up_bloc.dart';

class SignUpState {
  final String firstname;
  bool get isValidFirstname => firstname.length > 1;

  final String lastname;
  bool get isValidLastname => lastname.length > 1;

  final String username;
  bool get isValidUsername => username.length > 1;

  final String email;
  bool get isValidEmail => email.contains('@');

  final String password;
  bool get isValidPassword => password.length > 3;

  final String confirmPassword;
  bool get isValidConfirmPassword => confirmPassword == password;

  final FormSubmissionStatus formStatus;

  SignUpState(
      {this.firstname = '',
      this.lastname = '',
      this.username = '',
      this.email = '',
      this.password = '',
      this.confirmPassword = '',
      this.formStatus = const InitialFormStatus()});

  SignUpState copyWith({
    String? firstname,
    String? lastname,
    String? username,
    String? email,
    String? password,
    String? confirmPassword,
    FormSubmissionStatus? formStatus,
  }) {
    return SignUpState(
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
