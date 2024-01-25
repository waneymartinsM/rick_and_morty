part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class ToggleFavorites extends FavoriteEvent {
  final CharacterModel character;

  const ToggleFavorites(this.character);

  @override
  List<Object> get props => [character];
}