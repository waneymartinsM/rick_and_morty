import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/pages/widgets/character_image.dart';
import 'package:rick_and_morty/pages/widgets/character_status_circle.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/utils/text_styles.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.character});

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const BackButton(color: Colors.white),

      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final double maxHeight = constraints.maxHeight;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 20),
              child: Column(
                children: [
                  CharacterImage(character: character, size: maxHeight * 0.3),
                  const SizedBox(height: 10),
                  Text(
                    character.name.toUpperCase(),
                    style: CharacterTextStyle.characterNameDetail,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CharacterStatusCircle(status: character.status),
                      const SizedBox(width: 8),
                      Text(
                        '${character.status} - ${character.species}',
                        style: CharacterTextStyle.characterStatus,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    height: maxHeight * 0.5,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: BoxDecoration(
                      color: AppColors.body1,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _informationRow(
                            label: 'Gênero:',
                            value: character.gender,
                          ),
                          _informationRow(
                            label: 'Origem:',
                            value: 'character.origin.name',
                          ),
                          _informationRow(
                            label: 'Última localização conhecida:',
                            value: 'character.location.name',
                          ),
                          _informationRow(
                            label: 'Número de episódios:',
                            value: character.episode.length.toString(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Row _informationRow({
    required String value,
    required String label,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text(label, style: CharacterTextStyle.informationTitleRow),
        ),
        Expanded(
          child: Text(value, style: CharacterTextStyle.informationTextRow),
        ),
      ],
    );
  }
}
