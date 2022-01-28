import 'package:negadras/category/data_providers/category_data_provider.dart';
import 'package:negadras/category/models/category.dart';

class CategoryRepository {
  final CategoryDataProvider dataProvider;
  CategoryRepository(this.dataProvider);

  Future<Category> create(Category category) async {
    return this.dataProvider.create(category);
  }

  Future<Category> update(String id, Category category) async {
    return this.dataProvider.update(id, category);
  }

  Future<List<Category>> fetchAll() async {
    // print("Inside repo");
    return this.dataProvider.fetchAll();
  }

  Future<Category> fetchOne(String id) async {
    return this.dataProvider.fetchOne(id);
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}
