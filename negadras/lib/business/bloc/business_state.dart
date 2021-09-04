part of 'business_bloc.dart';

abstract class BusinessState extends Equatable {
  const BusinessState();

  List<Object> get props => [];
}

class BusinessInitial extends BusinessState {}

class BusinessLoading extends BusinessState {}

class BusinessLoaded extends BusinessState {
  final Business business;
  BusinessLoaded(this.business);
}

class BusinessSearchResult extends BusinessState {}

class BusinessFilterResult extends BusinessState {}
