import 'package:negadras/buisness/data_providers/buisness_data_provider.dart';
import 'package:negadras/buisness/models/buisness.dart';

class BuisnessRepository {
  final BuisnessDataProvider dataProvider;
  BuisnessRepository(this.dataProvider);

  Future<Buisness> create(Buisness buisness) async {
    return this.dataProvider.create(buisness);
  }

  Future<Buisness> update(int id, Buisness buisness) async {
    return this.dataProvider.update(id, buisness);
  }

  Future<List<Buisness>> fetchAll() async {
    return this.dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    this.dataProvider.delete(id);
  }
}