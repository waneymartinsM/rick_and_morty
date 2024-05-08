import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/icons.dart';

class CharacterErrorMessage extends StatelessWidget {
  const CharacterErrorMessage({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppIcons.notFound, height: 70),
          const SizedBox(height: 10),
          Text(message, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
