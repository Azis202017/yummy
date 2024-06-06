import 'package:flutter/material.dart';

class AppColors{
  static const darkGrey = Color(0xff635c5c);
  static const oren = Color(0xffF36C21);
  static const black = Colors.black;
  static const abumuda = Color(0xffF4F1F1);
  static const white = Color(0xfffffff);
}

class TextStyles{
  static TextStyle title = const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    color: AppColors.darkGrey,
  );

  static TextStyle body = const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.normal,
    fontSize: 16.0,
    color: AppColors.darkGrey,
  );
}
