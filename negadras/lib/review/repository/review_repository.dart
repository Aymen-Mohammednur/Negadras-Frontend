import 'package:negadras/review/data_providers/review_data_provider.dart';
import 'package:negadras/review/models/review.dart';

class ReviewRepository {
  final ReviewDataProvider dataProvider;
  ReviewRepository(this.dataProvider);

  Future<Review> create(Review review) async {
    print("Inside repository");
    return this.dataProvider.create(review);
  }

  Future<Review> update(String id, Review review) async {
    return this.dataProvider.update(id, review);
  }

  Future<List<Review>> fetchAll(String businessId) async {
    return this.dataProvider.fetchAll(businessId);
  }

  Future<Review> fetchOne(String businessId, String username) async {
    return this.dataProvider.fetchOne(businessId, username);
  }

  Future<void> delete(String businessId, String userId) async {
    this.dataProvider.delete(businessId, userId);
  }
}
