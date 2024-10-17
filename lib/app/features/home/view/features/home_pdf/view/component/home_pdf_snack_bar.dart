import 'package:flutter/material.dart';

class HomePdfSnackBar {
  final String message;
  final Duration duration;

  const HomePdfSnackBar({
    required this.message,
    this.duration = const Duration(seconds: 3),
  });

  void show(BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: Colors.lightGreen,
      content: Text(message),
      duration: duration,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
