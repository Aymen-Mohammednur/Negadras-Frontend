part of 'organization_bloc.dart';

class OrganizationState {
  final String organizationName;
  bool get isValidUsername => organizationName.length > 5;

  final FormSubmissionStatus formStatus;

  OrganizationState(
      {this.organizationName = '',
      this.formStatus = const InitialFormStatus()});

  OrganizationState copyWith({
    String? username,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return OrganizationState(
      organizationName: username ?? this.organizationName,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}
