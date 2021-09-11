part of 'user_review_bloc.dart';

class UserReviewState extends Equatable {
  UserReviewState(this.rating, {review});
  int rating = 0;
  String? review;

  factory UserReviewState.mergeWith(UserReviewState oldState, addedReview) {
    return UserReviewState(oldState.rating, review: addedReview);
  }
  List<Object> get props => [rating, review ?? ""];
}

class UserReviewInitial extends UserReviewState {
  UserReviewInitial() : super(-1);
}

class Rated extends UserReviewState {
  final int rating;
  Rated(this.rating) : super(rating);
}

class ReviewSent extends UserReviewState {
  Review r;
  ReviewSent(this.r) : super(r.rating, review: r.reviewText);
}

class ReviewVerified extends UserReviewState {
  ReviewVerified() : super(-1);
}

class ReviewExist extends UserReviewState {
  late Review reviewObj;
  ReviewExist(this.reviewObj)
      : super(reviewObj.rating, review: reviewObj.reviewText);
}

class UserReviewOperationFaliure extends UserReviewState {
  UserReviewOperationFaliure() : super(-1);
}
class TrashingReview extends UserReviewState{
  TrashingReview() : super(-1);
}