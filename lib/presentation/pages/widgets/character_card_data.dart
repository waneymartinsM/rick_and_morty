import 'package:flutter/material.dart';
import 'package:rick_and_morty/domain/models/dto/character_dto.dart';
import 'package:rick_and_morty/presentation/pages/widgets/character_status_circle.dart';
import 'package:rick_and_morty/utils/text_styles.dart';

class CharacterCardData extends StatelessWidget {
  const CharacterCardData({super.key, required this.character});
  final CharacterDto character;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            character.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CharacterTextStyle.characterName,
          ),
          const SizedBox(height: 5),
          Row(
            children: <Widget>[
              CharacterStatusCircle(status: character.status),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  '${character.status} - ${character.species}',
                  style: CharacterTextStyle.characterStatus,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}