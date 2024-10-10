import 'package:flutter/material.dart';
import 'package:pdf_app/app/core/extention/string/string_extention.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({
    super.key,
    required this.text,
    this.textStyle,
    this.fontFamily,
    this.textAlign,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.decoration,
    this.decorationColor,
  });

  final String text;
  final String? fontFamily;
  final double? fontSize;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;
  final Color? decorationColor;

  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.lang.tr,
      style: textStyle ?? TextStyle(
        fontSize: fontSize,
        color: color,
        decorationColor: decorationColor ?? Colors.white,
        decoration: decoration ?? TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: textAlign,
    );
  }
}

/// When you call this component use like that :
/// - LocaleText(text: LocaleKeys.appName, textStyle: TextStyle() );  for ex.
