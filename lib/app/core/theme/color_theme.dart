import 'package:flutter/material.dart';

final class ColorTheme {
  final ThemeData _theme;

  ColorTheme(this._theme);

  Color get primaryColor => _theme.primaryColor;

  Color get focusColor => _theme.focusColor;

  Color get unSelectedWidgetColor => _theme.unselectedWidgetColor;

  Color get backgroundColor => _theme.scaffoldBackgroundColor;

  Color get buttonColor =>
      _theme.buttonTheme.colorScheme?.background ?? Colors.grey;

  Color get iconColor => _theme.iconTheme.color ?? Colors.grey;

  Color get borderColor => _theme.shadowColor;
}
