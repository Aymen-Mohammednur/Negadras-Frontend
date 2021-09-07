import 'package:negadras/user/data_providers/user_data_provider.dart';
import 'package:negadras/user/models/user.dart';

class UserRepository {
  final UserDataProvider dataProvider;
  UserRepository(this.dataProvider);

  Future<User> update(String id, User user) async {
    return this.dataProvider.update(id, user);
  }
  Future<User> change(String id, User user) async {
    return this.dataProvider.change(id, user);
  }
  Future<User> fetchOne(String id) async {
    return this.dataProvider.fetchOne(id);
  }
  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}
