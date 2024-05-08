import 'package:flutter_test/flutter_test.dart';
import 'package:rick_and_morty/domain/models/dto/character_dto.dart';
import 'package:rick_and_morty/services/adapters/character_adapter.dart';

void main() {
  group('Adapters Character', () {
    test('deveria converter dados da API para CharacterModel', () async {
      final apiResponse = {
        'results': [
          {
            "id": 1,
            "name": "Rick Sanchez",
            "status": "Alive",
            "species": "Human",
            "type": "",
            "gender": "Male",
            "origin": {
              "name": "Earth (C-137)",
              "url": "https://rickandmortyapi.com/api/location/1"
            },
            "location": {
              "name": "Citadel of Ricks",
              "url": "https://rickandmortyapi.com/api/location/3"
            },
            "image": "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            "episode": [
              "https://rickandmortyapi.com/api/episode/1",
              "https://rickandmortyapi.com/api/episode/2",
            ],
            "url": "https://rickandmortyapi.com/api/character/1",
            "created": "2017-11-04T18:48:46.250Z"
          }
        ]
      };

      final List<CharacterDto> characters =
          CharacterAdapter.fromJson(apiResponse);
      final CharacterDto character = characters[0];

      expect(character.name, 'Rick Sanchez');
      expect(character.status, 'Alive');
      expect(character.species, 'Human');
      expect(character.location.name, 'Citadel of Ricks');
    });
  });
}
