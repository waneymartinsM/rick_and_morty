import 'package:dio/dio.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/services/repository_interface.dart';

class Repository extends RepositoryInterface {
  final Dio dio;
  static const _api = 'https://rickandmortyapi.com';

  Repository(this.dio);

  @override
  Future<List<CharacterModel>> loadingAllCharacters({required int page}) async {
    try {
      Response response = await dio.get('$_api/api/character/?page=$page');
      final data = response.data;

      List<CharacterModel> characters = data['results']
          .map<CharacterModel>(
              (characters) => CharacterModel.fromJson(characters))
          .toList();

      print("response: $characters");
      return characters;
    } catch (e) {
      rethrow;
    }
  }
}
