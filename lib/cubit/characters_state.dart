import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/models/character_model.dart';

abstract class CharactersState extends Equatable {}

class InitialState extends CharactersState {
  @override
  List<Object> get props => [];
}

class LoadingState extends CharactersState {
  @override
  List<Object> get props => [];
}

class SuccessState extends CharactersState {
  final List<CharacterModel> characters;

  SuccessState({required this.characters});

  @override
  List<Object> get props => [characters];
}

class ErrorState extends CharactersState {
  @override
  List<Object> get props => [];
}
