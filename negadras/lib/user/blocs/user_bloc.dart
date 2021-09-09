import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:negadras/user/models/user.dart';
import 'package:negadras/user/models/models.dart';

import 'package:negadras/user/repository/user_repository.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUser) {
      yield Fetching();
      await Future.delayed(Duration(seconds: 2));

      yield UserProfile();
    }

    // if (event is LoadBusiness) {
    //   yield Fetching();
    //   await Future.delayed(Duration(seconds: 2));
    //   yield BusinessView();
    // }
    // if (event is AddBusiness) {
    //   try {
    //     await businessRepository.create(event.business);
    //     final business = await businessRepository.fetch();
    //     yield BusinessOperationSuccess(business);
    //   } catch (_) {
    //     yield BusinessOperationFailure();
    //   }
    // }
    if (event is UpdateUsername) {
      try {
        final user = await userRepository.updateUsername(event.id, event.username);
        // final user = await userRepository.fetchOne(event.user.id);
        yield UserOperationSuccess();
      } catch (_) {
        yield UserOperationFailure();
      }
    }
    if (event is DeleteUser) {
      try {
        final user = await userRepository.delete(event.userid);
        // final user = await userRepository.fetchOne(userid);
        yield UserOperationSuccess();
      } catch (_) {
        yield UserOperationFailure();
      }
    }
  }
}
