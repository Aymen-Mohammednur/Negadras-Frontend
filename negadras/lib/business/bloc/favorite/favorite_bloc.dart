import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:negadras/business/models/models.dart';
import 'package:negadras/business/repository/buisness_repository.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final BusinessRepository businessRepository;

  FavoriteBloc({required this.businessRepository}) : super(FavoriteInitial());

  @override
  Stream<FavoriteState> mapEventToState(
    FavoriteEvent event,
  ) async* {
    if (event is ShowFavoritesEvent) {
      yield FetchingState();
      try {
        final businessList = await businessRepository.fetchFavorites();
        print("FavoriteBloc recieved businessList: ${businessList.length}");
        if (businessList.length == 0) {
          yield NoFavoriteState();
        }
        else yield FavoriteSuccess(businessList);
      } catch (e) {
        yield FavoriteFailure();
      }
    }

    if (event is RemoveFromFavoritesEvent) {
      await businessRepository.removeFromFavorites(event.businessId);
      final businessList = await businessRepository.fetchFavorites();
      yield FavoriteSuccess(businessList);
    }
  }
}
