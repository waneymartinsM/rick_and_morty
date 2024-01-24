import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/pages/detail_page.dart';
import 'package:rick_and_morty/pages/widgets/character_card_data.dart';
import 'package:rick_and_morty/pages/widgets/character_image.dart';
import 'package:rick_and_morty/utils/colors.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.character});

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Material(
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(character: character)));
            },
            splashColor: AppColors.body1.withOpacity(0.1),
            child: Ink(
              height: 100,
              width: double.infinity,
              color: AppColors.body1,
              child: Row(
                children: [
                  Container(
                    color: AppColors.body1,
                    child:
                        CharacterImage(character: character, size: 100),
                  ),
                  const SizedBox(width: 20),
                  CharacterCardData(character: character),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
