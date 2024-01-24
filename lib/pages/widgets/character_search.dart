import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/search/search_bloc.dart';
import 'package:rick_and_morty/pages/widgets/character_card.dart';
import 'package:rick_and_morty/pages/widgets/error_message.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/utils/icons.dart';
import 'package:rick_and_morty/utils/text_styles.dart';

class CharacterSearch extends SearchDelegate {
  CharacterSearch()
      : super(
          searchFieldLabel: 'Procure personagens pelo nome...',
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.search,
          searchFieldStyle: CharacterTextStyle.search,
        );

  final characters = [
    'Morty Smith',
    'Rick Sanchez',
    'Summer Smith',
    'Beth Smith',
    'Jerry Smith'
  ];

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith();
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
              showSuggestions(context);
            }
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
        if (state is SearchLoading) {
          return const Center(
              child: CircularProgressIndicator(color: AppColors.green));
        } else if (state is SearchLoaded) {
          final characters = state.characters;
          return ListView.builder(
              itemBuilder: (BuildContext context, int index) =>
                  CharacterCard(character: characters[index]));
        } else if (state is SearchError) {
          return const CharacterErrorMessage(
              message: "Nenhum resultado encontrado!");
        }
        return const Center();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = query.isEmpty ? characters : [];

    return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            onTap: () {
              query = suggestion;
              showResults(context);
            },
            leading: Image.asset(AppIcons().getIcon(suggestion), height: 40),
            title: RichText(
                text: TextSpan(
                    text: suggestion,
                    style: CharacterTextStyle.searchSuggestions)),
          );
        });
  }
}
