part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

// class NormalBusinessEvent extends FavoriteEvent {}

// class AddBusinessToFavoritesEvent extends FavoriteEvent {}

class ShowFavoritesEvent extends FavoriteEvent {}

// class AddToFavoritesEvent extends FavoriteEvent {
//   final String businessId;
//   AddToFavoritesEvent(this.businessId);
// }

// class RemoveFromFavoritesEvent extends FavoriteEvent {
//   final String businessId;
//   RemoveFromFavoritesEvent(this.businessId);
// }

class RemoveFromFavoritesEvent extends FavoriteEvent {
  final String businessId;
  RemoveFromFavoritesEvent(this.businessId);
}
