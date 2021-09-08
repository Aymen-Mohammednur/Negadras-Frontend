import 'package:negadras/auth/data_providers/auth-data-provider.dart';

import '../models/models.dart';

class AuthRepository {
  final AuthDataProvider dataProvider;
  AuthRepository(this.dataProvider);

  Future<Login> login(
      {required String username, required String password}) async {
    print('attempting login');
    if (username == 'valid' && password == 'password') {
      await Future.delayed(Duration(seconds: 2));
      print('logged in');
      final login = Login(username: username, password: password);
      return this.dataProvider.readLogin(login) as Login;
    }
    throw Exception('Login failed');
  }

  Future<Register> signUp(
      {required String username,
      required String lastname,
      required String firstname,
      required String password}) async {
    await Future.delayed(Duration(seconds: 2));
    final register = Register(
        username: username,
        password: password,
        lastname: lastname,
        firstname: firstname);
    return this.dataProvider.createRegister(register) as Register;
  }

  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
