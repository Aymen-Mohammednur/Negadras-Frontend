import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:negadras/review/models/models.dart';
import 'package:negadras/review/repository/review_repository.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewRepository reviewRepository;
  ReviewBloc(this.reviewRepository) : super(ReviewInitial());
  int? rating = 0;
  TextEditingController reviewController = TextEditingController();

  @override
  Stream<ReviewState> mapEventToState(ReviewEvent event) async* {
    if (event is PageOpen) {
      print("PageOpen detected in ReviewBloc");
      try {
        print(
            "attempting to yield review list with business ID : ${event.businessId}");

        final reviewList = await reviewRepository.fetchAll(event.businessId);
        print("review list yielded");
        yield ReviewPageLoaded(reviewList);
      } catch (_) {
        print("attempt to yield reviewlist failed with error $_");
        yield ReviewOperationFaliure();
      }
    }

    if (event is NormalReviewEvent) {
      yield ReviewInitial();
    }
  }
}
