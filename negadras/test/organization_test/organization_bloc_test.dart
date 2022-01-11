import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:negadras/business/bloc/business_bloc.dart';
import 'package:negadras/business/data_providers/buisness_data_provider.dart';
import 'package:negadras/business/models/business.dart';
import 'package:negadras/business/repository/buisness_repository.dart';
import 'package:negadras/organization/bloc/organization_bloc.dart';
import 'package:negadras/organization/data_providers/organization_data_provider.dart';
import 'package:negadras/organization/models/organization_model.dart';
import 'package:negadras/organization/repository/organization_repository.dart';

class MockLoginBloc extends MockBloc<OrganizationEvent, OrganizationState>
    implements OrganizationBloc {}

void main() {
  group('Organization bloc test', () {
    blocTest<OrganizationBloc, OrganizationState>(
      'emits [] when nothing is added',
      build: () {
        final OrganizationRepository organizationRepository =
            OrganizationRepository(OrganizationDataProvider());
        return OrganizationBloc(organizationRepository: organizationRepository);
      },
      expect: () => <BusinessState>[],
    );

    blocTest<OrganizationBloc, OrganizationState>(
      'Organization Load State',
      build: () {
        final OrganizationRepository organizationRepository =
            OrganizationRepository(OrganizationDataProvider());
        return OrganizationBloc(organizationRepository: organizationRepository);
      },
      act: (bloc) {
        return bloc.add(OrganizationLoad());
      },
      wait: const Duration(milliseconds: 500),
      expect: () {
        OrganizationState organizationState = OrganizationLoading();
        return [isA<OrganizationState>(), isA<OrganizationState>()];
      },
    );

    blocTest<OrganizationBloc, OrganizationState>(
      'Organization Load State',
      build: () {
        final OrganizationRepository organizationRepository =
            OrganizationRepository(OrganizationDataProvider());
        return OrganizationBloc(organizationRepository: organizationRepository);
      },
      act: (bloc) {
        return bloc.add(OrganizationLoad());
      },
      wait: const Duration(milliseconds: 500),
      expect: () {
        OrganizationState organizationState = OrganizationLoading();
        return [isA<OrganizationState>(), isA<OrganizationState>()];
      },
    );
  });
}
