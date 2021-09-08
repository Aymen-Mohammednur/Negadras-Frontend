part of 'review_bloc.dart';

abstract class ReviewState extends Equatable {
  const ReviewState();

  List<Object> get props => [];
}

class ReviewInitial extends ReviewState {}

class Rated extends ReviewState {
}

class ReviewStarted extends ReviewState{
}


class ReviewSent extends ReviewState {
  // ReviewSent({required userReview});
  // late String userReview;
}

class HasNotReviewed extends ReviewState {}

class ReviewExist extends ReviewState {
  ReviewExist({required reviewId});
  late String reviewId;
}

