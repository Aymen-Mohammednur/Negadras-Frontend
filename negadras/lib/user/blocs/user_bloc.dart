import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:negadras/user/form_submission_status.dart';

import 'package:negadras/user/repository/user_repository.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserState());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UpdateUsername) {
      try {
        await userRepository.updateUsername(event.username);
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed());
      }
    }
    if (event is UpdatePassword) {
      try {
        await userRepository.changePassword(event.password);
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed());
      }
    }
    if (event is DeleteUser) {
      try {
        await userRepository.delete(event.userid);
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed());
      }
    }
  }
}
