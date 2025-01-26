import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final double lineThickness;
  final Color lineColor;

  const DividerWithText({
    Key? key,
    required this.text,
    this.textStyle,
    this.lineThickness = 1.0,
    this.lineColor = Colors.grey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            thickness: lineThickness,
            color: lineColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: context.theme.getTextStyle.mediumBodyText1,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: lineThickness,
            color: lineColor,
          ),
        ),
      ],
    );
  }
}
