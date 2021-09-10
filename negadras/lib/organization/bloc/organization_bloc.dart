import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:negadras/organization/form_submission_status.dart';
import 'package:negadras/organization/data_providers/organization_data_provider.dart';
import 'package:negadras/organization/models/organization_model.dart';
import 'package:negadras/organization/repository/organization_repository.dart';

part 'organization_event.dart';
part 'organization_state.dart';

class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  final OrganizationRepository organizationRepository;
  OrganizationBloc({required this.organizationRepository})
      : super(OrganizationLoading());

  @override
  Stream<OrganizationState> mapEventToState(
    OrganizationEvent event,
  ) async* {
    if (event is OrganizationLoad) {
      yield OrganizationLoading();
      try {
        print("Inside org loading");
        final organizations = await organizationRepository.fetchByUserId();
        var a = organizations.length;
        print("Organization lenght: $a");
        if (organizations.length == 0) {
          yield NoOrganizationsState();
        } else {
          yield OrganizationOperationSuccess(organizations);
        }
      } catch (e) {
        print(e);
        yield OrganizationOperationFailure();
      }
    }

    if (event is OrganizationCreate) {
      try {
        await organizationRepository.create(event.organization);
        final organizations = await organizationRepository.fetchByUserId();
        yield OrganizationOperationSuccess(organizations);
      } catch (e) {
        yield OrganizationOperationFailure();
      }
    }

    if (event is OrganizationUpdate) {
      try {
        await organizationRepository.update(
            event.organization.id, event.organization);
        final organizations = await organizationRepository.fetchByUserId();
        yield OrganizationOperationSuccess(organizations);
      } catch (e) {
        yield OrganizationOperationFailure();
      }
    }

    if (event is OrganizationDelete) {
      try {
        await organizationRepository.delete(event.organizationId);
        final organizations = await organizationRepository.fetchByUserId();
        yield OrganizationOperationSuccess(organizations);
      } catch (_) {
        yield OrganizationOperationFailure();
      }
    }
  }
}
