import 'package:DocuSort/app/core/enum/custom_colors.dart';
import 'package:flutter/material.dart';

final class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(CustomColors.darkBlue.getColor),
      )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: CustomColors.darkBlue.getColor
    ),
  );

  static ThemeData dartTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(CustomColors.darkBlue.getColor),
        )
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: CustomColors.darkBlue.getColor
    ),
  );
}
