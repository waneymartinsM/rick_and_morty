import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/colors.dart';
import 'package:rick_and_morty/utils/text_styles.dart';

abstract class CharacterTheme {
  static ThemeData get dark => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.body,
      splashColor: AppColors.body,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.body1),
        backgroundColor: AppColors.body,
        elevation: 0,
        titleTextStyle: CharacterTextStyle.titleAppBar,
      ));
}
