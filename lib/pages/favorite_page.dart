import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/favorite/favorite_bloc.dart';
import 'package:rick_and_morty/domain/models/dto/character_dto.dart';
import 'package:rick_and_morty/pages/widgets/character_card.dart';
import 'package:rick_and_morty/pages/widgets/character_error_message.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final List<CharacterDto> favorite = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state.favorite.isEmpty) {
            return const CharacterErrorMessage(message: "");
          }
          return ListView.builder(
              itemCount: state.favorite.length,
              itemBuilder: (context, index) =>
                  CharacterCard(character: state.favorite[index]));
        },
      ),
    );
  }
}
