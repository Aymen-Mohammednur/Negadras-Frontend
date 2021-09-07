part of 'business_bloc.dart';

abstract class BusinessState extends Equatable {
  const BusinessState();

  List<Object> get props => [];
}

class BusinessInitial extends BusinessState {}

class BusinessSearching extends BusinessState {}

class AllBusinessesLoaded extends BusinessState {}

class BusinessLoaded extends BusinessState {
  final Business business;
  BusinessLoaded(this.business);
}

class Fetching extends BusinessState {}

class BusinessView extends BusinessState {}

class AllBusinessSearchResult extends BusinessState {}

class BusinessFilterResult extends BusinessState {}

class BusinessOperationSuccess extends BusinessState {
  final Iterable<Business> business;

  BusinessOperationSuccess([this.business = const[]]);

  @override
  List<Object> get props => [business];
}

class BusinessOperationFailure extends BusinessState {}
