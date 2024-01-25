import 'package:bloc/bloc.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:equatable/equatable.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(const FavoriteState()) {
    on<AddFavoriteListCharacter>(_onAddFavoriteListCharacter);
    on<RemoveFavoriteListCharacter>(_onRemoveFavoriteListCharacter);
  }

  void _onAddFavoriteListCharacter(
      AddFavoriteListCharacter event, Emitter<FavoriteState> emit) async {
    final state = this.state;

    if (state.favorite.contains(event.character) == false) {
      emit(FavoriteState(
          favorite: List.from(state.favorite)..add(event.character)));
    }
  }

  void _onRemoveFavoriteListCharacter(
      RemoveFavoriteListCharacter event, Emitter<FavoriteState> emit) {
    final state = this.state;

    emit(FavoriteState(
        favorite: List.from(state.favorite)..remove(event.character)));
  }
}
