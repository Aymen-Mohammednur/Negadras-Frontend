import 'package:negadras/auth/repository/auth-repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthRepository authRepository;

  RegisterBloc({required this.authRepository}) : super(RegisterNormal());

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is RegisterCreate) {
      try {
        final register = await authRepository.createRegister(event.register);
        yield RegisterOperationSuccess(register);
      } catch (_) {
        yield RegisterOperationFailure();
      }
    }
  }
}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginNormal());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginRead) {
      try {
        final login = await authRepository.readLogin(event.login);
        yield LoginOperationSuccess(login);
      } catch (_) {
        yield LoginOperationFailure();
      }
    }
  }
}
