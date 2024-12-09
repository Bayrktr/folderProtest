import 'package:flutter/material.dart';

class FavoriteSnackBar {
  final String message;
  final Duration duration;
  final Color color;

  const FavoriteSnackBar({
    required this.message,
    this.duration = const Duration(
      seconds: 1,
    ),
    this.color = Colors.lightGreen,
  });


  void show(BuildContext context) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message),
      duration: duration,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
