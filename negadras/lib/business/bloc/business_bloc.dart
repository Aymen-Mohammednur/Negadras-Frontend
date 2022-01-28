import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:negadras/business/models/models.dart';
import 'package:negadras/business/repository/buisness_repository.dart';

part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  final BusinessRepository businessRepository;

  BusinessBloc({required this.businessRepository})
      : super(BusinessInitialState());

  @override
  Stream<BusinessState> mapEventToState(
    BusinessEvent event,
  ) async* {
    if (event is NormalBusinessEvent) {
      yield BusinessInitialState();
    }

    if (event is FilterBusinessEvent) {
      yield FetchingState();
      final categoryId = event.categoryId;
      try {
        // print("About to fetch businesses under a category");
        final businessList =
            await businessRepository.fetchByCategory(categoryId);

        yield BusinessFetchResultState(businessList, categoryId as String);
      } catch (e) {
        // print(e.toString());
        // print("Unfortunately got error on the way");
        yield Failure(categoryId as String);
      }
    }

    if (event is SearchBusinessEvent) {
      yield FetchingState();
      final categoryId = event.categoryId;
      final queryParameter = event.queryParameter;
      try {
        // // print("About to fetch businesses under a category");
        final businessList =
            await businessRepository.fetchForSearch(queryParameter, categoryId);
        // print("finished fetching categories");
        // // print(
        //     "Result to check favorite here: ${businessList[0].isFavorite} ${businessList[1].isFavorite}");
        yield BusinessFetchResultState(businessList, categoryId);
      } catch (e) {
        // print(e.toString());
        // print("Unfortunately got error on the way");
        yield Failure(categoryId);
      }
    }

    // if (event is LoadBusinessEvent) {
    //   yield FetchingState();

    //   //When the backend works

    //   // final businessId = event.businessId;
    //   // final business = await businessRepository.fetchOne(businessId);
    //   // yield BusinessLoadedState(business);

    //   await Future.delayed(Duration(seconds: 2));
    //   yield BusinessView("");
    // }
    if (event is AddBusiness) {
      try {
        // // print("inside bloc");
        await businessRepository.create(event.business);

        final business = await businessRepository.fetch();
        yield BusinessOperationSuccess(business);
      } catch (e) {
        yield BusinessOperationFailure();
      }
    }
    if (event is UpdateBusiness) {
      try {
        await businessRepository.update(event.business.id, event.business);
        final business = await businessRepository.fetch();
        yield BusinessOperationSuccess(business);
      } catch (e) {
        yield BusinessOperationFailure();
      }
    }
    if (event is DeleteBusiness) {
      try {
        await businessRepository.delete(event.id);
        final business = await businessRepository.fetch();
        yield BusinessOperationSuccess(business);
      } catch (e) {
        yield BusinessOperationFailure();
      }
    }

//     if (event is ShowFavoritesEvent) {
//       yield FetchingState();
//       try {
//         //Fake list
//         // final businessList = [
//         //   Business(
//         //       id: "id",
//         //       name: "Negadras",
//         //       categoryId: "categoryId",
//         //       location: "5 Kilo, Gulele Zone",
//         //       isFavorite: true,
//         //       avgRating: 2),
//         //   Business(
//         //       id: "id",
//         //       name: "Friendship City Center",
//         //       categoryId: "categoryId",
//         //       location: "Bole, Cameroon Avenue",
//         //       isFavorite: true,
//         //       avgRating: 4),
//         //   Business(
//         //       id: "id",
//         //       name: "Edna Mall",
//         //       categoryId: "categoryId",
//         //       location: "Bole Zone",
//         //       isFavorite: true,
//         //       avgRating: 1.5),
//         //   Business(
//         //       id: "id",
//         //       name: "Capital Hotel",
//         //       categoryId: "categoryId",
//         //       location: "Hayahulet",
//         //       isFavorite: true,
//         //       avgRating: 4.5),
//         //   Business(
//         //       id: "id",
//         //       name: "Enat Wetet",
//         //       categoryId: "categoryId",
//         //       location: "5 Kilo, Anbessa Gebi",
//         //       isFavorite: true,
//         //       avgRating: 3),
//         //   Business(
//         //       id: "id",
//         //       name: "Kebele 19",
//         //       categoryId: "categoryId",
//         //       location: "Bole Street, Mamo Kacha",
//         //       isFavorite: true,
//         //       avgRating: 3.5),
//         //   Business(
//         //       id: "id",
//         //       name: "Kerim Suk",
//         //       categoryId: "categoryId",
//         //       location: "Bole Street, Rwanda Avenue",
//         //       isFavorite: true,
//         //       avgRating: 3),
//         //   Business(
//         //       id: "id",
//         //       name: "MHS Sports",
//         //       categoryId: "categoryId",
//         //       location: "Bole Michael, Riverside",
//         //       isFavorite: true,
//         //       avgRating: 2.5),
//         //   Business(
//         //       id: "id",
//         //       name: "5k Lounge",
//         //       categoryId: "categoryId",
//         //       location: "5 Kilo, Campus",
//         //       isFavorite: true,
//         //       avgRating: 0)
//         // ];

//         // //Granted a working repo and data provider
//         final businessList = await businessRepository.fetchFavorites();
//         if (businessList.length == 0) {
//           yield NoFavoriteState();
//         }

//         yield FavoriteSuccess(businessList);
//       } catch (e) {
//         // print("$e +++++++++ FETCH FAV ERROR");
//         yield FavoriteFailure();
//       }
//     }

    if (event is AddToFavoritesEvent) {
      await businessRepository.addToFavorites(event.businessId);
    }

    if (event is RemoveFromFavoritesEvent) {
      await businessRepository.removeFromFavorites(event.businessId);
    }
  }
}
