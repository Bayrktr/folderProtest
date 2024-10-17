import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pdf_app/app/product/bloc/theme/theme_state.dart';
import 'package:pdf_app/app/product/cache/hive/operation/theme_operation.dart';
import 'package:pdf_app/app/product/manager/getIt/getIt_manager.dart';
import 'package:pdf_app/app/product/model/theme/theme_model.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this.themeModel) : super(ThemeState(theme: themeModel));

  final ThemeModel themeModel;

  final ThemeData _themeDark = ThemeData.dark();
  final ThemeData _themeLight = ThemeData.light();
  final ThemeOperation _themeOperation = GetItManager.getIt<ThemeOperation>();

  void resetStatus() {
    emit(
      state.copyWith(
        status: ThemeStatus.initial,
      ),
    );
  }

  void setTheme() {
    final isLightMode = state.theme.themeData == _themeLight;
    final newTheme = isLightMode ? _themeDark : _themeLight;

    final newThemeModel = state.theme.copyWith(
      themeData: newTheme,
    );
    print(newTheme);
    emit(
      state.copyWith(
        theme: newThemeModel,
      ),
    );

    saveThemeToHive(newThemeModel);
  }

  Future<void> saveThemeToHive(ThemeModel newThemeModel) async {
    await _themeOperation.addOrUpdateItem(newThemeModel);
  }
}
