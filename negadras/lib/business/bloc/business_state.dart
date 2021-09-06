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
