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

class FilterBusinessEvent extends BusinessEvent {
  String? categoryId;
  FilterBusinessEvent(this.categoryId);
}

class NormalBusinessEvent extends BusinessEvent {}

class AddBusiness extends BusinessEvent {
  final Business business;

  const AddBusiness(this.business);

  @override
  List<Object> get props => [business];

  @override
  String toString() => 'Business Created {course: $business}';
}

class UpdateBusiness extends BusinessEvent {
  final Business business;

  const UpdateBusiness(this.business);

  @override
  List<Object> get props => [business];

  @override
  String toString() => 'Business Updated {business: $business}';
}

class DeleteBusiness extends BusinessEvent {
  final String id;

  const DeleteBusiness(this.id);

  @override
  List<Object> get props => [id];

  @override
  toString() => 'Business Deleted {business Id: $id}';
}

class AddBusinessToFavoritesEvent extends BusinessEvent {}

class ShowFavoritesEvent extends BusinessEvent {}

class AddToFavoritesEvent extends BusinessEvent {
  final String businessId;
  AddToFavoritesEvent(this.businessId);
}

class RemoveFromFavoritesEvent extends BusinessEvent {
  final String businessId;
  RemoveFromFavoritesEvent(this.businessId);
}
