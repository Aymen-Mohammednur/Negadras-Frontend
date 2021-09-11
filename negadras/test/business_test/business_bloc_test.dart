import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/business/data_providers/buisness_data_provider.dart';
import 'package:negadras/business/models/business.dart';
import 'package:negadras/business/repository/buisness_repository.dart';

class MockLoginBloc extends MockBloc<BusinessEvent, BusinessState> implements BusinessBloc {}

  void main(){
      group('Business bloc test', () {
        blocTest<BusinessBloc, BusinessState>(
          'emits [] when nothing is added',
          build: () {
            final BusinessRepository businessRepository = BusinessRepository(BusinessDataProvider());
            return  BusinessBloc(businessRepository: businessRepository);
          },
          expect: () => <BusinessState>[],
        );

        blocTest<BusinessBloc, BusinessState>(
          'Business Initial State',
          build: () {
            final BusinessRepository businessRepository = BusinessRepository(BusinessDataProvider());
            return  BusinessBloc(businessRepository: businessRepository);
          },
          act:(bloc){
            return bloc.add(
                NormalBusinessEvent());
          },
          wait: const Duration(milliseconds: 500),
          expect: () {
            BusinessState businessState = BusinessInitialState();
            return [isA<BusinessState>()];
          },
        );


        blocTest<BusinessBloc, BusinessState>(
          'Business FilterBusinessEvent State',
          build: () {
            final BusinessRepository businessRepository = BusinessRepository(BusinessDataProvider());
            return  BusinessBloc(businessRepository: businessRepository);
          },
          act:(bloc){
            return bloc.add(
                FilterBusinessEvent(""));
          },
          wait: const Duration(milliseconds: 500),
          expect: () {
            BusinessState businessState = BusinessFetchResultState([],"");
            return [isA<BusinessState>(), isA<BusinessState>()];
          },
        );

        blocTest<BusinessBloc, BusinessState>(
          'Business Search State',
          build: () {
            final BusinessRepository businessRepository = BusinessRepository(BusinessDataProvider());
            return  BusinessBloc(businessRepository: businessRepository);
          },
          act:(bloc){
            return bloc.add(
                SearchBusinessEvent("", ""));
          },
          wait: const Duration(milliseconds: 500),
          expect: () {
            BusinessState businessState = BusinessFetchResultState([],"");
            return [isA<BusinessState>(), isA<BusinessState>()];
          },
        );

      });
  }