import 'package:rick_and_morty/models/character_model.dart';

abstract class CharacterAdapter {
  static List<CharacterModel> fromJson(dynamic json) {
    return json['results']
        .map<CharacterModel>((data) => CharacterModel.fromJson(data))
        .toList();
  }
}
