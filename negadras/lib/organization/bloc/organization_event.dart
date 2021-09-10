part of 'organization_bloc.dart';

abstract class OrganizationEvent extends Equatable {
  const OrganizationEvent();
}

class OrganizationLoad extends OrganizationEvent {
  const OrganizationLoad();

  @override
  List<Object> get props => [];
}

class OrganizationCreate extends OrganizationEvent {
  final Organization organization;

  const OrganizationCreate(this.organization);

  @override
  List<Object> get props => [organization];

  @override
  String toString() => 'Organization Created {Organization: $organization}';
}

class OrganizationUpdate extends OrganizationEvent {
  final Organization organization;

  const OrganizationUpdate(this.organization);

  @override
  List<Object> get props => [Organization];

  @override
  String toString() => 'Organization Updated {Organization: $organization}';
}

class OrganizationDelete extends OrganizationEvent {
  final String organizationId;

  const OrganizationDelete(this.organizationId);

  @override
  List<Object> get props => [organizationId];

  @override
  toString() => 'Organization Deleted {Organization Id: $organizationId}';
}
