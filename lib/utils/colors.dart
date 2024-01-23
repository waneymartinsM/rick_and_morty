import 'package:flutter/material.dart';

class AppColors {
  static const Color body = Color(0xff202329);
  static const Color body1 = Color(0xff626569);
  static const Color green = Color(0xff97ce4c);
  static const Color aliveColor = Color(0xff617734);
  static const Color deadColor = Color(0xffe85356);

  static colorStatus(String status) {
    return status == 'Alive'
        ? AppColors.aliveColor
        : status == 'Dead'
        ? AppColors.deadColor
        : Colors.grey;
  }
}