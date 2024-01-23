import 'package:flutter/material.dart';

abstract class CharacterTextStyle {
  static const characterName = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.white,
    fontFamily: 'Poppins',
  );

  static const characterStatus = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontFamily: 'Poppins',
  );

  static const characterNameDetail = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: 'Poppins',
  );

  static const characterTextDetail = TextStyle(
    fontSize: 15,
    color: Colors.white,
    fontFamily: 'Poppins',
  );
}
