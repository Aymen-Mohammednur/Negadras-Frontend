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
    if (event is SearchBusinessEvent) {
      yield FetchingState();
      await Future.delayed(Duration(seconds: 2));

      // try {
      //   final businessList = await businessRepository.fetch();
      //   yield BusinessFetchResultState(businessList);
      // } catch (e) {
      //   yield BusinessOperationFailure(e as Exception);
      // }

      //Fake Fetch - Static Data
      yield StaticFetchState();
    }

    if (event is LoadBusinessEvent) {
      yield FetchingState();

      //When the backend works

      // final businessId = event.businessId;
      // final business = await businessRepository.fetchOne(businessId);
      // yield BusinessLoadedState(business);

      await Future.delayed(Duration(seconds: 2));
      yield BusinessView("");
    }
    if (event is AddBusiness) {
      try {
        await businessRepository.create(event.business);
        final business = await businessRepository.fetch();
        yield BusinessOperationSuccess(business);
      } catch (e) {
        yield BusinessOperationFailure(e as Exception);
      }
    }
    if (event is UpdateBusiness) {
      try {
        await businessRepository.update(event.business.id, event.business);
        final business = await businessRepository.fetch();
        yield BusinessOperationSuccess(business);
      } catch (e) {
        yield BusinessOperationFailure(e as Exception);
      }
    }
    if (event is DeleteBusiness) {
      try {
        await businessRepository.delete(event.id);
        final business = await businessRepository.fetch();
        yield BusinessOperationSuccess(business);
      } catch (e) {
        yield BusinessOperationFailure(e as Exception);
      }
    }
  }
}
