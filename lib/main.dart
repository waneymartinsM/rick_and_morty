import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/cubit/characters_cubit.dart';
import 'package:rick_and_morty/pages/home_page.dart';
import 'package:rick_and_morty/services/repository.dart';
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
        BlocProvider(create: (_) => CharactersCubit(repository: repository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Rick And Morty',
        theme: CharacterTheme.dark,
        home: const HomePage(),
      ),
    );
  }
}
