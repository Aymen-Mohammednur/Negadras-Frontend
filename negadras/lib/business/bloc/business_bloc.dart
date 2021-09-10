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
    if (event is FilterBusinessEvent) {
      yield FetchingState();

      try {
        final categoryId = event.categoryId;
        final businessList =
            await businessRepository.fetchByCategory(categoryId);
        print(businessList[0].name);
        yield BusinessFetchResultState(businessList);
      } catch (e) {
        print(e);
        yield BusinessOperationFailure();
      }

      //Fake Fetch - Static Data
      // yield StaticFetchState();
    }

    if (event is ShowFavoritesEvent) {
      final favorites = false;
      yield FetchingState();
      try {
        //Fake list
        final businessList = [
          Business(
              id: "id",
              name: "Negadras",
              categoryId: "categoryId",
              location: "5 Kilo, Gulele Zone",
              favorite: true),
          Business(
              id: "id",
              name: "Friendship City Center",
              categoryId: "categoryId",
              location: "Bole, Cameroon Avenue",
              favorite: true),
          Business(
              id: "id",
              name: "Edna Mall",
              categoryId: "categoryId",
              location: "Bole Zone",
              favorite: true),
          Business(
              id: "id",
              name: "Capital Hotel",
              categoryId: "categoryId",
              location: "Hayahulet",
              favorite: true),
          Business(
              id: "id",
              name: "Enat Wetet",
              categoryId: "categoryId",
              location: "5 Kilo, Anbessa Gebi",
              favorite: true),
          Business(
              id: "id",
              name: "Kebele 19",
              categoryId: "categoryId",
              location: "Bole Street, Mamo Kacha",
              favorite: true),
          Business(
              id: "id",
              name: "Kerim Suk",
              categoryId: "categoryId",
              location: "Bole Street, Rwanda Avenue",
              favorite: true),
          Business(
              id: "id",
              name: "MHS Sports",
              categoryId: "categoryId",
              location: "Bole Michael, Riverside",
              favorite: true),
          Business(
              id: "id",
              name: "5k Lounge",
              categoryId: "categoryId",
              location: "5 Kilo, Campus",
              favorite: true)
        ];

        // //Granted a working repo and data provider
        // final businessList = await businessRepository.fetchFavorites(userId);

        yield BusinessFetchResultState(businessList);
      } catch (e) {
        yield BusinessOperationFailure();
      }
    }

    if (event is AddToFavoritesEvent) {
      await businessRepository.addToFavorites(event.businessId, event.userId);
    }

    if (event is RemoveFromFavoritesEvent) {
      await businessRepository.removeFromFavorites(
          event.businessId, event.userId);
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
        // print("inside bloc");
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
  }
}
