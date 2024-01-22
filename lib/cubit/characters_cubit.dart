import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/cubit/characters_state.dart';
import 'package:rick_and_morty/services/repository.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit({required this.repository}) : super(InitialState());

  final Repository repository;
  int initialPage = 1;
  bool isLoading = false;

  Future<void> loadingAllCharacters() async {
    try {
      emit(LoadingState());
      print("carregando");
      isLoading = true;

      final response = await repository.loadingAllCharacters(page: initialPage);
      initialPage++;
      print("response: $response");
      emit(SuccessState(characters: response));
      isLoading = false;
    } catch (e) {
      emit(ErrorState());
    }
  }
}
