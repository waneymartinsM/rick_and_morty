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

  CharactersBloc({required this.repository}) : super(InitialState()) {
    on<LoadingCharactersEvent>((event, emit) async {
      emit(LoadingState());
      print("carregando");

      try {
        characterList = await repository.loadingAllCharacters(page: 2);
        emit(SuccessState(characters: characterList));
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });
  }
}
