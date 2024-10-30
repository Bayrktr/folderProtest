import 'package:flutter/material.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';

class CustomPopup extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;

  const CustomPopup({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: <Widget>[
        ElevatedButton(
          onPressed: onConfirm,
          child: const LocaleText(text: LocaleKeys.general_okey),
        ),
      ],
    );
  }
}
