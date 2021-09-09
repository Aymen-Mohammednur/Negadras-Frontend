part of 'business_bloc.dart';

abstract class BusinessState extends Equatable {
  const BusinessState();

  List<Object> get props => [];
}

class BusinessInitialState extends BusinessState {
  final String id;
  BusinessInitialState(this.id);
}

class FetchingState extends BusinessState {}

class BusinessLoadedState extends BusinessState {
  final Business business;
  BusinessLoadedState(this.business);
}

class BusinessView extends BusinessState {
  final String businessId;
  BusinessView(this.businessId);
}

class BusinessFetchResultState extends BusinessState {
  final List<Business> businessList;
  BusinessFetchResultState(this.businessList);
}

class StaticFetchState extends BusinessState {}

class BusinessFilterResult extends BusinessState {}

class BusinessOperationSuccess extends BusinessState {
  final Iterable<Business> business;

  BusinessOperationSuccess([this.business = const []]);

  @override
  List<Object> get props => [business];
}

class BusinessOperationFailure extends BusinessState {
  final Exception errMsg;

  BusinessOperationFailure(this.errMsg);
}
