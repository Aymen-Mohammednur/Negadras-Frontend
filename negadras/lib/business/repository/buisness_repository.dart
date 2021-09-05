import 'package:negadras/business/data_providers/buisness_data_provider.dart';
import 'package:negadras/business/models/models.dart';

class BusinessRepository {
  final BusinessDataProvider dataProvider;
  BusinessRepository(this.dataProvider);

  Future<Business> create(Business Business) async {
    return this.dataProvider.create(Business);
  }

  Future<Business> update(String id, Business Business) async {
    return this.dataProvider.update(id, Business);
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
