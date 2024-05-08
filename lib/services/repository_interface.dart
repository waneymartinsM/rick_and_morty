import 'package:rick_and_morty/domain/models/dto/character_dto.dart';

abstract class RepositoryInterface {
  Future<List<CharacterDto>> getCharacters({required int page});
  Future<List<CharacterDto>> searchCharacter({required String query});
}
