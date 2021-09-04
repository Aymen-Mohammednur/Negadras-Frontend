import 'package:negadras/review/data_providers/review_data_provider.dart';
import 'package:negadras/review/models/review.dart';

class ReviewRepository {
  final ReviewDataProvider dataProvider;
  ReviewRepository(this.dataProvider);

  Future<Review> create(Review review) async {
    return this.dataProvider.create(review);
  }

  Future<Review> update(String id, Review review) async {
    return this.dataProvider.update(id, review);
  }

  Future<List<Review>> fetchAll() async {
    return this.dataProvider.fetchAll();
  }

  Future<Review> fetchOne(String id) async {
    return this.dataProvider.fetchOne(id);
  }

  Future<void> delete(String id) async {
    this.dataProvider.delete(id);
  }
}
