import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/services/repository.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final Repository repository;
  List<CharacterModel> characterList = [];
  bool isFetching = false;
  int page = 1;

  CharactersBloc({required this.repository}) : super(InitialState()) {
    on<LoadingCharactersEvent>((event, emit) async {
      emit(LoadingState());
      isFetching = true;

      try {
        characterList = await repository.getCharacters(page: page);
        isFetching = false;
        emit(SuccessState(characters: characterList));
        page++;
      } catch (e) {
        isFetching = false;
        emit(ErrorState(e.toString()));
      }
    });
  }
}
