import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:negadras/business/models/business.dart';
import 'package:negadras/business/models/models.dart';

import 'package:negadras/business/repository/buisness_repository.dart';
part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  final BusinessRepository businessRepository;

  BusinessBloc({required this.businessRepository}) : super(BusinessInitial());

  @override
  Stream<BusinessState> mapEventToState(
    BusinessEvent event,
  ) async* {
    if (event is SearchBusinesses) {
      yield Fetching();
      await Future.delayed(Duration(seconds: 2));

      // //When the backend works
      //
      // final businessId = event.businessId;
      // final realBusiness = await businessRepository.fetchOne(businessId);
      // yield BusinessLoaded(realBusiness);

      // final business = Business(
      //     id: "test_id",
      //     name: "Kaldis' Coffee",
      //     type: "Restaurant",
      //     location: "302 Bole Street");

      yield AllBusinessSearchResult();
    }

    if (event is LoadBusiness) {
      yield Fetching();
      await Future.delayed(Duration(seconds: 2));
      yield BusinessView();
    }
    if (event is AddBusiness) {
      try {
        await businessRepository.create(event.business);
        final business = await businessRepository.fetchAll();
        yield BusinessOperationSuccess(business);
      } catch (_) {
        yield BusinessOperationFailure();
      }
    }
    if (event is UpdateBusiness) {
      try {
        await businessRepository.update(event.business.id, event.business);
        final courses = await businessRepository.fetchAll();
        yield BusinessOperationSuccess(courses);
      } catch (_) {
        yield BusinessOperationFailure();
      }
    }
  }
}
