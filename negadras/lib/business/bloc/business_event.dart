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
