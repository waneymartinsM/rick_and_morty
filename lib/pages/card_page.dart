import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/characters/characters_bloc.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/pages/widgets/character_card.dart';
import 'package:rick_and_morty/pages/widgets/character_error_message.dart';
import 'package:rick_and_morty/utils/colors.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final List<CharacterModel> character = [];
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
          if (state is InitialState ||
              state is LoadingState && character.isEmpty) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.green));
          } else if (state is ErrorState && character.isEmpty) {
            return const CharacterErrorMessage(
                message: "Erro ao carregar personagens...");
          } else if (state is SuccessState) {
            character.addAll(state.characters);
          }
          return ListView.builder(
            controller: _scrollController
              ..addListener(() async {
                if (_scrollController.position.pixels ==
                        _scrollController.position.maxScrollExtent &&
                    !BlocProvider.of<CharactersBloc>(context).isFetching) {
                  BlocProvider.of<CharactersBloc>(context)
                      .add(LoadingCharactersEvent());
                }
              }),
            itemCount: character.length,
            itemBuilder: (context, index) {
              return CharacterCard(character: character[index]);
            },
          );
        },
      ),
    );
  }
}
