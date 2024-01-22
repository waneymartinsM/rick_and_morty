import 'package:rick_and_morty/models/character_model.dart';

abstract class RepositoryInterface {
  Future<List<CharacterModel>> loadingAllCharacters({required int page});
}
