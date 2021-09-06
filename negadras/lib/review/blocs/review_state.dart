part of 'review_bloc.dart';

abstract class ReviewState extends Equatable {
  const ReviewState();

  List<Object> get props => [];
}

class ReviewInitial extends ReviewState {}

class HasReviewed extends ReviewState {
  HasReviewed({required reviewId});
  late String reviewId;
}

class ClientReviewed extends ReviewState {
  ClientReviewed({required userReview});
  late String userReview;
}

class HasNotReviewed extends ReviewState {}

class RatingEntered extends ReviewState {}
