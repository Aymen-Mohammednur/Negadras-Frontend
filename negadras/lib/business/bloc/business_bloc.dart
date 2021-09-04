import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:negadras/business/models/models.dart';
// import 'package:negadras/business/repository/buisness_repository.dart';

part 'business_event.dart';
part 'business_state.dart';

class BusinessBloc extends Bloc<BusinessEvent, BusinessState> {
  // final BusinessRepository businessRepository;
  BusinessBloc() : super(BusinessInitial());

  @override
  Stream<BusinessState> mapEventToState(
    BusinessEvent event,
  ) async* {
    if (event is LoadBusiness) {
      yield BusinessLoading();
      await Future.delayed(Duration(seconds: 2));

      // //When the backend works
      //
      // final businessId = event.businessId;
      // final realBusiness = await businessRepository.fetchOne(businessId);
      // yield BusinessLoaded(realBusiness);

      final business = Business(
          id: "test_id",
          name: "Kaldis' Coffee",
          type: "Restaurant",
          location: "302 Bole Street");

      yield BusinessLoaded(business);
    }
  }
}
