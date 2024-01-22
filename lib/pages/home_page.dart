import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/cubit/characters_cubit.dart';
import 'package:rick_and_morty/cubit/characters_state.dart';
import 'package:rick_and_morty/models/character_model.dart';
import 'package:rick_and_morty/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<CharacterModel> _character = [];
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _onScroll();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _onScroll() {
    _scrollController.addListener(() async {
      if (_scrollController.position.maxScrollExtent ==
              _scrollController.offset &&
          !context.read<CharactersCubit>().isLoading) {
        context.read<CharactersCubit>().loadingAllCharacters();
      }
    });
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
      body: LayoutBuilder(builder: (context, constraints) {
        return BlocBuilder<CharactersCubit, CharactersState>(
            builder: (context, state) {
          if (state is InitialState || state is LoadingState) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.green));
          } else if (state is ErrorState) {
            return const Center(
                child: Icon(Icons.warning_amber_outlined, color: Colors.red));
          } else if (state is SuccessState) {
            _character.addAll(state.characters);
          }
          return ListView.builder(
              itemCount: _character.length,
              itemBuilder: (context, index) {
                return Text(_character[index].name);
              });
        });
      }),
    );
  }
}
