part of 'business_bloc.dart';

abstract class BusinessEvent extends Equatable {
  const BusinessEvent();

  @override
  List<Object> get props => [];
}

class LoadBusiness extends BusinessEvent {
  final String businessId;
  LoadBusiness({required this.businessId});
}

class SearchBusinesses extends BusinessEvent {}

class AddBusiness extends BusinessEvent {
  final Business business;

  const AddBusiness(this.business);

  @override
  List<Object> get props => [business];

  @override
  String toString() => 'Course Created {course: $business}';
}
class UpdateBusiness extends BusinessEvent {
  final Business business;

  const UpdateBusiness(this.business);

  @override
  List<Object> get props => [business];

  @override
  String toString() => 'Course Updated {course: $business}';
}
class DeleteBusiness extends BusinessEvent {
  final String id;

  const DeleteBusiness(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Course Deleted {course Id: $id}';
}
