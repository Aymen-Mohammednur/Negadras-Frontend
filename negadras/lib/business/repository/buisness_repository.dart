import 'package:negadras/business/data_providers/buisness_data_provider.dart';
import 'package:negadras/business/models/business.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BusinessRepository {
  final BusinessDataProvider dataProvider;
  BusinessRepository(this.dataProvider);

  Future<Business> create(Business business) async {
    // print("inside repo");
    return this.dataProvider.create(business);
  }

  Future<Business> update(String id, Business business) async {
    return this.dataProvider.update(id, business);
  }

  Future<List<Business>> fetch() async {
    return this.dataProvider.fetch();
  }

  Future<Business> fetchOne(String id) async {
    return this.dataProvider.fetchOne(id);
  }

  Future<List<Business>> fetchByCategory(String? categoryId) async {
    print("Inside business repo");
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final userId = await prefs.getString("user_id");
    return this.dataProvider.fetchByCategory(categoryId, userId);
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }

  Future<void> fetchFavorites() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final userId = await prefs.getString("user_id") as String;

    this.dataProvider.fetchFavorites(userId);
  }

  Future<void> addToFavorites(
    String businessId,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final userId = await prefs.getString("user_id") as String;
    this.dataProvider.addToFavorites(businessId, userId);
  }

  Future<void> removeFromFavorites(String businessId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final userId = await prefs.getString("user_id") as String;
    this.dataProvider.removeFromFavorites(businessId, userId);
  }
}
