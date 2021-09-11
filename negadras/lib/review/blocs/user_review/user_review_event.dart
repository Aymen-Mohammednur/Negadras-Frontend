part of 'user_review_bloc.dart';

class UserReviewEvent extends Equatable {
  const UserReviewEvent();

  @override
  List<Object> get props => [];
}

class RatingAdd extends UserReviewEvent {
  late int rating;
  RatingAdd(this.rating);
}

class InitialUser extends UserReviewEvent {}

class ReviewAdd extends UserReviewEvent {
  late String businessId;
  late String userId;
  ReviewAdd(this.businessId, this.userId);
}

class ReviewFoundOnServer extends UserReviewEvent {
  late Review review;
  ReviewFoundOnServer(this.review);
}
class ReviewReset extends UserReviewEvent{}


class ReviewDelete extends UserReviewEvent{
  late String businessId;
  late String userId;
  ReviewDelete(this.businessId, this.userId);
}