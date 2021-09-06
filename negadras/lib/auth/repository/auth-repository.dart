import 'package:negadras/auth/data_providers/auth-data-provider.dart';
import 'package:negadras/auth/models/models.dart';

class AuthRepository {
  final AuthDataProvider dataProvider;
  AuthRepository(this.dataProvider);

  Future<Register> createRegister(Register register) async {
    return this.dataProvider.createRegister(register);
  }

  Future<Login> readLogin(Login login) {
    return this.dataProvider.readLogin(login);
  }
}
