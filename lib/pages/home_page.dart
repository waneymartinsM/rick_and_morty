import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/characters/characters_bloc.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/pages/widgets/character_card.dart';
import 'package:rick_and_morty/pages/widgets/character_error_message.dart';
import 'package:rick_and_morty/pages/widgets/character_search.dart';
import 'package:rick_and_morty/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      appBar: AppBar(
        // title: Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Text("Rick and Morty"),
        //     const SizedBox(height: 10),
        //     _buildSearch(),
        //   ],
        // ),
        title: const Text("Rick and Morty"),
        actions: [_buildSearch()],
      ),
      body: _buildBody(),
    );
  }

  IconButton _buildSearch() {
    return IconButton(
        onPressed: () {
          showSearch(context: context, delegate: CharacterSearch());
        },
        padding: const EdgeInsets.only(right: 20),
        icon: const Icon(Icons.search_rounded, size: 25));
  }

  LayoutBuilder _buildBody() {
    return LayoutBuilder(
      builder: (context, constraints) {
        return BlocBuilder<CharactersBloc, CharactersState>(
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
        );
      },
    );
  }
}
