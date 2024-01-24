import 'package:rick_and_morty/models/character_model.dart';

abstract class RepositoryInterface {
  Future<List<CharacterModel>> getCharacters({required int page});
  Future<List<CharacterModel>> searchCharacter({required String query});
}
