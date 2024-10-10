import 'package:flutter/material.dart';
import 'package:pdf_app/app/core/theme/color_theme.dart';
import 'package:pdf_app/app/core/theme/text_theme.dart';

final class CustomThemeExtention {
  CustomThemeExtention(BuildContext context) : _context = context;

  final BuildContext _context;

  ThemeData get _getTheme => Theme.of(_context);

  ColorTheme get getColor => ColorTheme(_getTheme);

  CustomTextStyle get getTextStyle => CustomTextStyle(_getTheme);
}
