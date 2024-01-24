import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/search/search_bloc.dart';
import 'package:rick_and_morty/pages/widgets/character_card.dart';
import 'package:rick_and_morty/utils/colors.dart';

class CharacterSearch extends SearchDelegate {
  CharacterSearch({required String hintText})
      : super(
          searchFieldLabel: hintText,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
        );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<SearchBloc>(context, listen: false)
        .add(Search(query: query));
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (BuildContext context, state) {
        if (state is SearchUninitialized) {
          return const Center(
              child: CircularProgressIndicator(color: AppColors.green));
        } else if (state is SearchLoaded) {
          final characters = state.characters;
          if (characters.isEmpty) {
            return const Center(child: Text("Nenhum resultado encontrado!"));
          } else if (state is SearchError) {
            return const Center(child: Text("Ocorreu um erro!"));
          }
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  CharacterCard(character: characters[index]));
        }
        return const Center();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
