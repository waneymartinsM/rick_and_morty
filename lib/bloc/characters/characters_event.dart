part of 'characters_bloc.dart';

@immutable
abstract class CharactersEvent extends Equatable {
  const CharactersEvent();
}

class LoadingCharactersEvent extends CharactersEvent {
  @override
  List<Object> get props => [];
}