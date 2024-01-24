import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/services/repository_interface.dart';

class Repository extends RepositoryInterface {
  final Dio dio;
  static const _api = 'https://rickandmortyapi.com';

  Repository(this.dio);

  @override
  Future<List<CharacterModel>> getCharacters({required int page}) async {
    try {
      Response response = await dio.get('$_api/api/character/?page=$page');
      final data = response.data;

      List<CharacterModel> characters = data['results']
          .map<CharacterModel>(
              (characters) => CharacterModel.fromJson(characters))
          .toList();
      return characters;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CharacterModel>> searchCharacter({required String query}) async {
    try {
      Response response = await dio.get('$_api/api/character/?name=$query');
      final data = response.data;

      List<CharacterModel> character = data['results']
          .map<CharacterModel>(
              (characters) => CharacterModel.fromJson(characters))
          .toList();

      return character;
    } catch (e) {
      rethrow;
    }
  }
}
