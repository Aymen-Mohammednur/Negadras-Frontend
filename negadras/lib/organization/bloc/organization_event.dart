part of 'organization_bloc.dart';

@immutable
abstract class OrganizationEvent extends Equatable {}

class OrganizationNameChanged extends OrganizationEvent {
  final String organizationName;

  OrganizationNameChanged({required this.organizationName});

  @override
  List<Object> get props => [organizationName];

  @override
  String toString() => 'Org Created {org: $organizationName}';
}

class OrganizationSubmitted extends OrganizationEvent {
  final Organization organization;
  OrganizationSubmitted(this.organization);

  @override
  List<Object> get props => [organization];

  @override
  String toString() => 'Org Created {org: $organization}';
}
