part of 'review_bloc.dart';

abstract class ReviewEvent extends Equatable {
  const ReviewEvent();

  @override
  List<Object> get props => [];
}


class RatingEnter extends ReviewEvent {
  final int rating;
  RatingEnter({required int this.rating});
}

class ReviewStart extends ReviewEvent {
  final int rating;
  ReviewStart({required int this.rating});
}

class ReviewDelete extends ReviewEvent {
  final String reviewId;
  ReviewDelete({required String this.reviewId});
}
class ReviewAdd extends ReviewEvent {
  // final String reviewDetails;
  // ReviewAdd({required String this.reviewDetails});
}


class ReviewExistNotify extends ReviewEvent {
  final String reviewId;
  ReviewExistNotify({required String this.reviewId});
}