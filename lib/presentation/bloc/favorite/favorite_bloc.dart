import 'package:bloc/bloc.dart';
import 'package:rick_and_morty/domain/models/dto/character_dto.dart';
import 'package:equatable/equatable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    on<ToggleFavorites>(_onToggleFavorites);
  }

  void _onToggleFavorites(
      ToggleFavorites event, Emitter<FavoriteState> emit) async {
    final state = this.state;

    if (state.favorite.contains(event.character) == false) {
      emit(FavoriteState(
          favorite: List.from(state.favorite)..add(event.character)));
    } else {
      emit(FavoriteState(
          favorite: List.from(state.favorite)..remove(event.character)));
    }
  }
}
