part of 'search_bloc.dart';

@immutable
abstract class SearchState extends Equatable {}

class SearchInitial extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoading extends SearchState {
  @override
  List<Object> get props => [];
}

class SearchLoaded extends SearchState {
  SearchLoaded({required this.characters});

  final List<CharacterDto> characters;

  @override
  List<Object> get props => [characters];
}

class SearchError extends SearchState {
  final String message;

  SearchError(this.message);

  @override
  List<Object> get props => [message];
}

class SearchEmpty extends SearchState {
  @override
  List<Object> get props => [];
}
