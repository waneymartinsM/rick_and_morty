import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/bloc/characters/characters_bloc.dart';
import 'package:rick_and_morty/bloc/favorite/favorite_bloc.dart';
import 'package:rick_and_morty/bloc/search/search_bloc.dart';
import 'package:rick_and_morty/pages/splash_page.dart';
import 'package:rick_and_morty/services/repository.dart';
import 'package:rick_and_morty/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Repository();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => CharactersBloc(repository: repository)
              ..add(LoadingCharactersEvent())),
        BlocProvider<FavoriteBloc>(create: (_) => FavoriteBloc()),
        BlocProvider<SearchBloc>(
            create: (_) => SearchBloc(repository: repository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick And Morty',
        theme: CharacterTheme.dark,
        home: const SplashPage(),
      ),
    );
  }
}
