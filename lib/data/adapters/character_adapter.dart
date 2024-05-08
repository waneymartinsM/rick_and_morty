import 'package:rick_and_morty/domain/models/dto/character_dto.dart';

abstract class CharacterAdapter {
  static List<CharacterDto> fromJson(dynamic json) {
    return json['results']
        .map<CharacterDto>((data) => CharacterDto.fromJson(data))
        .toList();
  }
}
