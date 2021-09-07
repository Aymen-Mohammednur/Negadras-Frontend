

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

  Future<List<Business>> fetchAll() async {
    return this.dataProvider.fetchAll();
  }

  Future<Business> fetchOne(String id) async {
    return this.dataProvider.fetchOne(id);
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}
