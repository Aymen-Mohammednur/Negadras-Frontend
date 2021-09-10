import 'package:negadras/user/data_providers/user_data_provider.dart';
import 'package:negadras/user/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final UserDataProvider dataProvider;
  UserRepository({required this.dataProvider});

  Future<User> updateUsername(String username) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = await prefs.getString("user_id");

    return this.dataProvider.updateUsername(id as String, username);
  }

  Future<User> changePassword(String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final id = await prefs.getString("user_id");

    return this.dataProvider.changePassword(id as String, password);
  }

  Future<User> fetchOne(String id) async {
    return this.dataProvider.fetchOne(id);
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}
