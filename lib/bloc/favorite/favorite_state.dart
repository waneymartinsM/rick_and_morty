part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final List<CharacterModel> favorite;

  const FavoriteState({this.favorite = const <CharacterModel>[]});

  @override
  List<Object> get props => [favorite];
}
