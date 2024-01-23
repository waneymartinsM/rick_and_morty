import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/utils/text_styles.dart';

class CharacterDetailPage extends StatelessWidget {
  const CharacterDetailPage({super.key, required this.character});

  final CharacterModel character;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 180,
                  width: 180,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(character.image),
                  ),
                ),
                Text(
                  character.name,
                  style: CharacterTextStyle.characterName,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  width: double.infinity,
                  height: constraints.maxHeight * 0.5,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.body1,
                    borderRadius: BorderRadius.circular(20)
                  ),
                ),
              ],
            ),
          ),
        );
      },),
    );
  }
}
