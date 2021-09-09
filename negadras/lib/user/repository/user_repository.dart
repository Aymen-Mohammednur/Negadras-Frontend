import 'package:negadras/user/data_providers/user_data_provider.dart';
import 'package:negadras/user/models/user.dart';

class UserRepository {
  final UserDataProvider dataProvider;
  UserRepository(this.dataProvider);

  Future<User> updateUsername(String id, String username) async {
    return this.dataProvider.updateUsername(id, username);
  }
  Future<User> changePassword(String id, String password) async {
    return this.dataProvider.changePassword(id, password);
  }
  Future<User> fetchOne(String id) async {
    return this.dataProvider.fetchOne(id);
  }
  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}
