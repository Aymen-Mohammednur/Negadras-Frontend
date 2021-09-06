import 'dart:async';
import 'dart:convert';
// import 'dart:html';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:negadras/business/models/models.dart';
// import 'package:negadras/business/repository/buisness_repository.dart';

part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(HasNotReviewed());

  @override
  Stream<ReviewState> mapEventToState(
    ReviewEvent event,
  ) async* {
    if (event is StartReview) {
      yield RatingEntered();
    } else if (event is ReviewExistNotify) {
      yield HasReviewed(reviewId: event.reviewId);
    } else if (event is AddReview) {
      yield ClientReviewed(userReview: event.reviewDetails);
    } else if (event is DeleteReview) {
      yield ReviewInitial();
    }
  }
}

// class BusinessBloc extends Bloc<ReviewEvent, ReviewState> {
//   // final BusinessRepository businessRepository;
//   BusinessBloc() : super(BusinessInitial());

//   @override
//   Stream<BusinessState> mapEventToState(
//     BusinessEvent event,
//   ) async* {
//     if (event is SearchBusinesses) {
//       yield Fetching();
//       await Future.delayed(Duration(seconds: 2));

//       // //When the backend works
//       //
//       // final businessId = event.businessId;
//       // final realBusiness = await businessRepository.fetchOne(businessId);
//       // yield BusinessLoaded(realBusiness);

//       // final business = Business(
//       //     id: "test_id",
//       //     name: "Kaldis' Coffee",
//       //     type: "Restaurant",
//       //     location: "302 Bole Street");

//       yield AllBusinessSearchResult();
//     }

//     if (event is LoadBusiness) {
//       yield Fetching();
//       await Future.delayed(Duration(seconds: 2));
//       yield BusinessView();
//     }
//   }
// }
