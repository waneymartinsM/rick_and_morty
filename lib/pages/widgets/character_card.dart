import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/favorite/favorite_bloc.dart';
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
        borderRadius: const BorderRadius.horizontal(
          left: Radius.circular(100),
          right: Radius.circular(90),
        ),
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
                  CharacterImage(character: character, size: 100),
                  const SizedBox(width: 20),
                  CharacterCardData(character: character),
                  BlocBuilder<FavoriteBloc, FavoriteState>(
                      builder: (context, state) {
                    final containsCharacter =
                        state.favorite.contains(character);
                    return IconButton(
                      onPressed: () {
                        context
                            .read<FavoriteBloc>()
                            .add(ToggleFavorites(character));
                      },
                      icon: Icon(containsCharacter
                          ? Icons.favorite_outlined
                          : Icons.favorite_border_outlined),
                      iconSize: 25,
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
