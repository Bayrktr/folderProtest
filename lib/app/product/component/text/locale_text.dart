import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:flutter/material.dart';

class LocaleText extends StatelessWidget {
  const LocaleText({
    super.key,
    required this.text,
    this.args,
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
  final List<String>? args;
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
    String translatedText = text.lang.tr;
    if (args != null && args!.isNotEmpty) {
      for (var i = 0; i < args!.length; i++) {
        translatedText = translatedText.replaceFirst('{}', args![i]);
      }
    }

    return Text(
      translatedText,
      style: textStyle ??
          TextStyle(
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
