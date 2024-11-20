import 'package:flutter/material.dart';

class HomeDirectorySnackBar {
  final String message;
  final Duration duration;

  const HomeDirectorySnackBar({
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
