import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/presentation/bloc/characters/characters_bloc.dart';
import 'package:rick_and_morty/presentation/bloc/favorite/favorite_bloc.dart';
import 'package:rick_and_morty/presentation/bloc/search/search_bloc.dart';
import 'package:rick_and_morty/data/repositories/repository.dart';
import 'package:rick_and_morty/presentation/pages/splash_page.dart';
import 'package:rick_and_morty/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repository = Repository(Dio());

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
