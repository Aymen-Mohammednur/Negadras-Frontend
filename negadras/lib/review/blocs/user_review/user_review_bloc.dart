import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/review/models/models.dart';
import 'package:negadras/review/repository/review_repository.dart';

part 'user_review_event.dart';
part 'user_review_state.dart';

class UserReviewBloc extends Bloc<UserReviewEvent, UserReviewState> {
  ReviewRepository reviewRepository;
  UserReviewBloc(this.reviewRepository) : super(UserReviewInitial());

  TextEditingController reviewController = TextEditingController();

  @override
  Stream<UserReviewState> mapEventToState(
    UserReviewEvent event,
  ) async* {
    if (event is InitialUser) {
      yield UserReviewInitial();
    }

    if (event is RatingAdd) {
      yield Rated(event.rating);
    } else if (event is ReviewAdd) {
      Review reviewToSend = _makeReviewObject(event);
      try {
        await reviewRepository.create(reviewToSend);
        // var allReviews = reviewRepository.fetchAll(reviewToSend.businessId);

        yield ReviewSent(reviewToSend);
        print("Review sent to server");
      } catch (_) {
        print("Review did not reach server");
        print(_);
        yield UserReviewOperationFaliure();
      }
    } else if (event is ReviewFoundOnServer) {
      yield ReviewExist(event.review);
    } else if (event is ReviewReset) {
      yield UserReviewInitial();
    } else if (event is ReviewDelete) {
      yield TrashingReview();
      try {
        await reviewRepository.delete(event.businessId, event.userId);
        yield UserReviewInitial();
      } catch (_) {
        yield UserReviewOperationFaliure();
      }
      // delete review here

      yield UserReviewInitial();
    }
    //else {
    //   yield UserReviewOperationFaliure();
    // }
  }

  Review _makeReviewObject(ReviewAdd event) => Review(
        id: " ",
        username: " ",
        businessId: event.businessId,
        userId: event.userId,
        rating: state.rating,
        reviewText: reviewController.text,
      );
}
