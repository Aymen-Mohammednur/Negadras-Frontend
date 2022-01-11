part of 'organization_bloc.dart';

abstract class OrganizationState extends Equatable {
  const OrganizationState();

  @override
  List<Object> get props => [];
}

class OrganizationLoading extends OrganizationState {}

class NoOrganizationsState extends OrganizationState {}

class OrganizationOperationSuccess extends OrganizationState {
  final List<Organization> organizations;

  OrganizationOperationSuccess([this.organizations = const []]);

  @override
  List<Object> get props => [organizations];
}

class OrganizationOperationFailure extends OrganizationState {
  // final Exception e;
  // OrganizationOperationFailure({required this.e});
}
