part of 'favorite_bloc.dart';

class FavoriteState extends Equatable {
  final List<CharacterDto> favorite;

  const FavoriteState({this.favorite = const <CharacterDto>[]});

  @override
  List<Object> get props => [favorite];
}
