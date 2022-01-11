import 'package:negadras/auth/data_providers/auth-data-provider.dart';
import 'package:negadras/auth/models/response/loginResponse.dart';
import 'package:negadras/auth/models/response/registerResponse.dart';

import '../models/models.dart';

class AuthRepository {
  final AuthDataProvider dataProvider;
  AuthRepository(this.dataProvider);

  Future<LoginResponse> login(
      {required String username, required String password}) async {
    try {
      print('attempting login');
      Login login = Login(username: username, password: password);
      return dataProvider.readLogin(login);
    } catch (e) {
      throw Exception('Login failed $e');
    }
  }

  Future<RegisterResponse> signUp(
      {required String username,
      required String lastname,
      required String firstname,
      required String password}) async {
    try {
      // print("attempting signup");
      final register = Register(
          username: username,
          password: password,
          lastname: lastname,
          firstname: firstname);
      // print("Register: $register");
      return dataProvider.createRegister(register);
    } catch (e) {
      throw Exception("SignUp failed");
    }
  }

  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
