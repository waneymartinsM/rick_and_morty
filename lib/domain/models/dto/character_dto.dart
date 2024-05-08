import 'package:rick_and_morty/domain/models/dto/location_dto.dart';
import 'package:rick_and_morty/domain/models/entity/character_entity.dart';

class CharacterDto extends CharacterEntity {
  CharacterDto({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required Map<String, dynamic> origin,
    required Map<String, dynamic> location,
    required String image,
    required List<String> episode,
    required String url,
    required String created,
  }) : super(
          id: id,
          name: name,
          status: status,
          species: species,
          type: type,
          gender: gender,
          origin: LocationDto.fromJson(origin),
          location: LocationDto.fromJson(location),
          image: image,
          episode: episode,
          url: url,
          created: DateTime.parse(created),
        );

  factory CharacterDto.fromJson(Map<String, dynamic> json) => CharacterDto(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: json["origin"],
        location: json["location"],
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: json["created"],
      );
}
