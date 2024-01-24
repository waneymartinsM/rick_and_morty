import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/models/character_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteBloc> {
  FavoriteBloc() : super(LoadingState()) {
    on<StartFavoriteList>(_onStartFavoriteList);
  }

  void _onStartFavoriteList(
      StartFavoriteList event, Emitter<FavoriteState> emit) {
    emit(LoadingState());

    try {
      Future<void>.delayed(const Duration(seconds: 1));
      emit(LoadedState());
    } catch(_){}
  }
}
