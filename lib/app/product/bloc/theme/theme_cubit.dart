import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pdf_app/app/product/bloc/theme/theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(theme: ThemeData.dark()));

  final ThemeData _themeDark = ThemeData.dark();
  final ThemeData _themeLight = ThemeData.light();

  void setTheme() {
    emit(
      state.copyWith(
        theme: state.theme == _themeDark ? _themeLight : _themeDark,
      ),
    );
  }
}
