import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:bloc_test/bloc_test.dart';
import 'package:negadras/auth/data_providers/auth-data-provider.dart';
import 'package:negadras/auth/form_submission_status.dart';
import 'package:negadras/auth/login/bloc/login_bloc.dart';
import 'package:negadras/auth/repository/auth_repository.dart';
import 'package:negadras/auth/signup/bloc/sign_up_bloc.dart';
import 'package:test/test.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

void main() {
  group('Authbloc login test', () {
    blocTest<LoginBloc, LoginState>(
      'emits [] when nothing is added',
      build: () {
        final AuthRepository authRepo =
            AuthRepository(AuthDataProvider(http.Client()));
        return LoginBloc(authRepo: authRepo);
      },
      expect: () => <LoginState>[],
    );

    blocTest<LoginBloc, LoginState>(
      'Login Username changed',
      build: () {
        final AuthRepository authRepo =
            AuthRepository(AuthDataProvider(http.Client()));
        return LoginBloc(authRepo: authRepo);
      },
      act: (bloc) {
        return bloc.add(LoginUsernameChanged(username: "username"));
      },
      wait: const Duration(milliseconds: 500),
      expect: () {
        LoginState usernameState = LoginState(
            username: 'username',
            password: '',
            formStatus: InitialFormStatus());
        return [isA<LoginState>()];
      },
    );

    blocTest<LoginBloc, LoginState>(
      'Login Password changed',
      build: () {
        final AuthRepository authRepo =
            AuthRepository(AuthDataProvider(http.Client()));
        return LoginBloc(authRepo: authRepo);
      },
      act: (bloc) {
        return bloc.add(LoginPasswordChanged(password: "password"));
      },
      wait: const Duration(milliseconds: 500),
      expect: () {
        return [isA<LoginState>()];
      },
    );

    blocTest<LoginBloc, LoginState>(
      'On submit login',
      build: () {
        final AuthRepository authRepo =
            AuthRepository(AuthDataProvider(http.Client()));
        return LoginBloc(authRepo: authRepo);
      },
      act: (bloc) {
        return bloc.add(LoginSubmitted());
      },
      wait: const Duration(milliseconds: 500),
      expect: () {
        return [isA<LoginState>(), isA<LoginState>()];
      },
    );
  });
  group('Authbloc register test', () {
    blocTest<SignUpBloc, SignUpState>(
      'emits [] when nothing is added',
      build: () {
        final AuthRepository authRepo =
            AuthRepository(AuthDataProvider(http.Client()));
        return SignUpBloc(authRepo: authRepo);
      },
      expect: () => <SignUpState>[],
    );

    blocTest<SignUpBloc, SignUpState>(
      'Signup submitted',
      build: () {
        final AuthRepository authRepo =
            AuthRepository(AuthDataProvider(http.Client()));
        return SignUpBloc(authRepo: authRepo);
      },
      act: (bloc) {
        return bloc.add(SignUpSubmitted());
      },
      wait: const Duration(milliseconds: 500),
      expect: () {
        return [isA<SignUpState>(), isA<SignUpState>()];
      },
    );
  });
}
