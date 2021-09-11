part of 'review_bloc.dart';

class ReviewState extends Equatable {
  const ReviewState();

  List<Object> get props => [];

  get rating => rating;
}

class ReviewInitial extends ReviewState {}

class ReviewPageLoaded extends ReviewState {
  List<Review> reviewList;
  ReviewPageLoaded(this.reviewList);
}

class HasNotReviewed extends ReviewState {}

class ReviewOperationFaliure extends ReviewState {}
