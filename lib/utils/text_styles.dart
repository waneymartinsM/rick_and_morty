import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/colors.dart';

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

  static const informationTitleRow = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontFamily: 'Poppins',
  );

  static const informationTextRow = TextStyle(
    fontSize: 18,
    color: Colors.white,
    fontFamily: 'Poppins',
  );

  static const titleAppBar = TextStyle(
    color: AppColors.green,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    fontFamily: 'Poppins',
  );
}
