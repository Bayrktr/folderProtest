import 'package:flutter/material.dart';

class EditDirectorySnackBar {
  final String message;
  final Duration duration;

  const EditDirectorySnackBar({
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
