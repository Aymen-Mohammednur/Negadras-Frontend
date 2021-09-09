import 'package:negadras/auth/data_providers/auth-data-provider.dart';

import '../models/models.dart';

class AuthRepository {
  final AuthDataProvider dataProvider;
  AuthRepository(this.dataProvider);

  Future<Login> login(
      {required String username, required String password}) async {
    try{
      print('attempting login');
      final login = Login(username: username, password: password);
      return dataProvider.readLogin(login) as Login;
    }catch(e){
      throw Exception('Login failed');
    }


  }

  Future<Register> signUp(
      {required String username,
      required String lastname,
      required String firstname,
      required String password}) async {

    try{
      // print("attempting signup");
      final register = Register(
          username: username,
          password: password,
          lastname: lastname,
          firstname: firstname);
      // print("Register: $register");
      return this.dataProvider.createRegister(register) as Register;
    }catch(e){
      throw Exception("SignUp failed");
    }

  }

  Future<void> signOut() async {
    await Future.delayed(Duration(seconds: 2));
  }
}
