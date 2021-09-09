part of 'organization_bloc.dart';

class OrganizationState {
  final String organizationName;
  bool get isValidUsername => organizationName.length > 5;

  final Organization? organization;

  final List<Organization>? organizations;

  final FormSubmissionStatus formStatus;

  OrganizationState(
      {this.organizationName = '',
      this.organization = null,
      this.organizations = null,
      this.formStatus = const InitialFormStatus()});

  OrganizationState copyWith({
    String? organizationName,
    Organization? organization,
    List<Organization>? organizations,
    FormSubmissionStatus? formStatus,
  }) {
    return OrganizationState(
      organizationName: organizationName ?? this.organizationName,
      organization: organization ?? this.organization,
      organizations: organizations ?? this.organizations,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
