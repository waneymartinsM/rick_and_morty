import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/characters/characters_bloc.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/utils/text_styles.dart';

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
        title: const Text("Rick and Morty"),
        actions: [_buildSearch()],
      ),
      body: _buildBody(),
    );
  }

  IconButton _buildSearch() {
    return IconButton(
        onPressed: () {},
        padding: const EdgeInsets.only(right: 20),
        icon: const Icon(
          Icons.search_rounded,
          size: 25,
          color: AppColors.body1,
        ));
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
              return const Center(
                  child: Icon(Icons.warning_amber_outlined, color: Colors.red));
            } else if (state is SuccessState) {
              character.addAll(state.characters);
            }
            return _buildListCharacters();
          },
        );
      },
    );
  }

  Widget _buildListCharacters() {
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
        return _cardCharacter(character: character[index]);
      },
    );
  }

  Widget _cardCharacter({required final CharacterModel character}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 100,
          width: double.infinity,
          color: AppColors.body1,
          child: Row(
            children: [
              Image.network(character.image, fit: BoxFit.cover),
              const SizedBox(width: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    character.name,
                    style: CharacterTextStyle.characterName,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: character.status == 'Alive'
                              ? Colors.green
                              : character.status == 'Dead'
                                  ? Colors.red
                                  : Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        "${character.status} - ${character.species}",
                        style: CharacterTextStyle.characterStatus,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
