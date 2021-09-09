part of 'business_bloc.dart';

abstract class BusinessEvent extends Equatable {
  const BusinessEvent();

  @override
  List<Object> get props => [];
}

class LoadBusinessEvent extends BusinessEvent {
  final String businessId;
  LoadBusinessEvent({required this.businessId});
}

class SearchBusinessEvent extends BusinessEvent {}

class AddBusiness extends BusinessEvent {
  final Business business;

  const AddBusiness(this.business);

  @override
  List<Object> get props => [business];

  @override
  String toString() => 'Course Created {course: $business}';
}

class AddBusinessToFavoritesEvent extends BusinessEvent {}

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
