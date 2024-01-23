import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/characters/characters_bloc.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CharacterModel> _character = [];
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
        actions: [
          IconButton(
              onPressed: () {},
              padding: const EdgeInsets.only(right: 20),
              icon: const Icon(
                Icons.search_rounded,
                size: 30,
                color: AppColors.body1,
              )),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return BlocBuilder<CharactersBloc, CharactersState>(
            builder: (context, state) {
              if (state is InitialState ||
                  state is LoadingState && _character.isEmpty) {
                return const Center(
                    child: CircularProgressIndicator(color: AppColors.green));
              } else if (state is ErrorState && _character.isEmpty) {
                return const Center(
                    child:
                        Icon(Icons.warning_amber_outlined, color: Colors.red));
              } else if (state is SuccessState) {
                _character.addAll(state.characters);
              }
              return ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 5),
                controller: _scrollController
                  ..addListener(() async {
                    if (_scrollController.position.pixels ==
                            _scrollController.position.maxScrollExtent &&
                        !BlocProvider.of<CharactersBloc>(context).isFetching) {
                      BlocProvider.of<CharactersBloc>(context)
                          .add(LoadingCharactersEvent());
                    }
                  }),
                itemCount: _character.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_character[index].name),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
