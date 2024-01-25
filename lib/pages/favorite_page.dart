import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/favorite/favorite_bloc.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/pages/widgets/character_card.dart';
import 'package:rick_and_morty/pages/widgets/character_error_message.dart';
import 'package:rick_and_morty/utils/colors.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final List<CharacterModel> favorite = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state is LoadingState && favorite.isEmpty) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.green));
          } else if (state is ErrorState) {
            return const CharacterErrorMessage(
                message: "Erro ao carregar personagens favoritos...");
          } else if (state is LoadedState) {
            favorite.addAll(state.favoriteList);
            return ListView.builder(
              itemCount: favorite.length,
              itemBuilder: (context, index) =>
                  CharacterCard(character: favorite[index]),
            );
          }
          return const Center();
        },
      ),
    );
  }
}
