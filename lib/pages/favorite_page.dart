import 'package:flutter/material.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/pages/detail_page.dart';
import 'package:rick_and_morty/services/repository_interface.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<CharacterModel> character = [];
  late RepositoryInterface repository;

  @override
  void initState() {
    super.initState();
    loadCharacter();
  }

  void loadCharacter() async {
    List<CharacterModel> favoriteCharacter =
        await repository.getFavoritesCharacters();
    setState(() {
      character = favoriteCharacter;
    });
    print(character);
  }

  openDetailsScreen(CharacterModel character) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailPage(character: character)));
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
