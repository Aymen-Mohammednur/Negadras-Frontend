part of 'review_bloc.dart';

abstract class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}

class AddReview extends ReviewEvent {
  final String reviewDetails;
  AddReview({required String this.reviewDetails});
}

class ReviewExistNotify extends ReviewEvent {
  final String reviewId;
  ReviewExistNotify({required String this.reviewId});
}

class DeleteReview extends ReviewEvent {
  final String reviewId;
  DeleteReview({required String this.reviewId});
}

class StartReview extends ReviewEvent {
  final int rating;
  StartReview({required int this.rating});
}
