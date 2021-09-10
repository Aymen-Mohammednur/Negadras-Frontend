import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:negadras/auth/models/response/registerResponse.dart';
import 'package:negadras/auth/repository/auth_repository.dart';
import 'package:negadras/auth/form_submission_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepository authRepo;
  SignUpBloc({required this.authRepo}) : super(SignUpState());

  @override
  Stream<SignUpState> mapEventToState(
    SignUpEvent event,
  ) async* {
    // First Name updated
    if (event is SignUpFirstnameChanged) {
      yield state.copyWith(firstname: event.firstname);

      // Last Name updated
    } else if (event is SignUpLastnameChanged) {
      yield state.copyWith(lastname: event.lastname);
    } // Username updated
    else if (event is SignUpUsernameChanged) {
      yield state.copyWith(username: event.username);

      // Password Updated
    } else if (event is SignUpPasswordChanged) {
      yield state.copyWith(password: event.password);

      // Email updated
    } else if (event is SignUpEmailChanged) {
      yield state.copyWith(email: event.email);

      // Confirm Password updated
    } else if (event is SignUpConfirmPasswordChanged) {
      yield state.copyWith(confirmPassword: event.confirmPassword);

      // Form Submitted
    } else if (event is SignUpSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        RegisterResponse registerResponse = await authRepo.signUp(
            username: state.username,
            lastname: state.lastname,
            firstname: state.firstname,
            password: state.password);

        yield state.copyWith(formStatus: SubmissionSuccess(registerResponse));
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e as Exception));
      }
    }
  }
}
