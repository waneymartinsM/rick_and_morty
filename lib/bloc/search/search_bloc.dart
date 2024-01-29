import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/services/repository.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Repository repository;

  SearchBloc({required this.repository}) : super(SearchInitial()) {
    on<Search>(onSearch);
  }

  onSearch(Search event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      List<CharacterModel> characterList =
          await repository.searchCharacter(query: event.query);
      emit(SearchLoaded(characters: characterList));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
