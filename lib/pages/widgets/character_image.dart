import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/utils/colors.dart';

class CharacterImage extends StatelessWidget {
  const CharacterImage({
    super.key,
    required this.character,
    required this.size,
  });

  final CharacterModel character;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.id,
      child: ClipOval(
        child: CachedNetworkImage(
          fit: BoxFit.fitHeight,
          height: size,
          placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(color: AppColors.green)),
          imageUrl: character.image,
        ),
      ),
    );
  }
}
