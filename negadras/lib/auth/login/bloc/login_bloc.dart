import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:negadras/auth/form_submission_status.dart';
import 'package:negadras/auth/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepo;
  LoginBloc({required this.authRepo}) : super(LoginState());
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();


  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    // Username updated
    if (event is LoginUsernameChanged) {
      yield state.copyWith(username: event.username);
      // Password updated
    } else if (event is LoginPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Form Submitted
    } else if (event is LoginSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await authRepo.login(
            username: state.username, password: state.password);

        // context.router.push(LoginView())
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        print("Exception at login event $e");
        yield state.copyWith(formStatus: SubmissionFailed(e as Exception));
      }
    }
  }
}
