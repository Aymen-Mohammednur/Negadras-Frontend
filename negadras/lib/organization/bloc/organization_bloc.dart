import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:negadras/auth/form_submission_status.dart';
import 'package:negadras/organization/data_providers/organization_data_provider.dart';
import 'package:negadras/organization/models/organization_model.dart';
import 'package:negadras/organization/repository/organization_repository.dart';

part 'organization_event.dart';
part 'organization_state.dart';

class OrganizationBloc extends Bloc<OrganizationEvent, OrganizationState> {
  final OrganizationRepository orgRepo;
  OrganizationBloc({required this.orgRepo}) : super(OrganizationState());

  @override
  Stream<OrganizationState> mapEventToState(
    OrganizationEvent event,
  ) async* {
    // Username updated
    if (event is OrganizationNameChanged) {
      yield state.copyWith(username: event.organizationName);

      // Form Submitted
    } else if (event is OrganizationSubmitted) {
      yield state.copyWith(formStatus: FormSubmitting());

      try {
        await orgRepo.create(event.organization);
        yield state.copyWith(formStatus: SubmissionSuccess());
      } catch (e) {
        yield state.copyWith(formStatus: SubmissionFailed(e as Exception));
      }
    }
  }
}
