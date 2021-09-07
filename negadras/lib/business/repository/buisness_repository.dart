import 'package:negadras/business/data_providers/buisness_data_provider.dart';
import 'package:negadras/business/models/business.dart';

class BusinessRepository {
  final BusinessDataProvider dataProvider;
  BusinessRepository(this.dataProvider);

  Future<Business> create(Business business) async {
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

  Future<List<Business>> fetchByCategory(String categoryId) async {
    return this.dataProvider.fetchByCategory(categoryId);
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}
