part of 'favorite_bloc.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  List<Object> get props => [];
}

// class BusinessInitialState extends FavoriteState {
//   // final String id;
//   // BusinessInitialState(this.id);
// }

class FetchingState extends FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class NoFavoriteState extends FavoriteState {}

class FavoriteFetch extends FavoriteState {}

class FavoriteSuccess extends FavoriteState {
  final List<Business> businessList;
  FavoriteSuccess(this.businessList);
}

class FavoriteFailure extends FavoriteState {}
