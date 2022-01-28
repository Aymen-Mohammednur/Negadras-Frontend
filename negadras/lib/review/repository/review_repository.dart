import 'package:negadras/review/data_providers/review_data_provider.dart';
import 'package:negadras/review/models/review.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ReviewRepository {
  final ReviewDataProvider dataProvider;
  ReviewRepository(this.dataProvider);

  Future<Review> create(Review review) async {
    // print("Inside repository");
    SharedPreferences pref = await SharedPreferences.getInstance();
    final userId = pref.getString("user_id") as String;
    // // print(pref.getString("userId"));
    // // print("SSSSSSSSSSSSSSSSSSSSSSSSSSSSS");
    review.userId = userId;
    // // print(userId);
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
    SharedPreferences pref = await SharedPreferences.getInstance();
    String suserId = pref.getString("userId") as String;
    this.dataProvider.delete(businessId, suserId);
  }
}
