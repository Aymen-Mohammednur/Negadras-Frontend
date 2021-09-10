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
        final businessList =
            await businessRepository.fetchByCategory(categoryId);
        print(businessList[0].name);
        yield BusinessFetchResultState(businessList, categoryId as String);
      } catch (e) {
        print(e.toString());
        yield Failure(categoryId as String);
      }

      //Fake Fetch - Static Data
      // yield StaticFetchState();
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
