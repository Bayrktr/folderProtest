import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState with EquatableMixin {
  ThemeState({
    required this.theme,
  });
  final ThemeData theme;

  @override
  List<Object?> get props => [
        theme,
      ];

  ThemeState copyWith({
    ThemeData? theme,
  }) =>
      ThemeState(theme: theme ?? this.theme);
}
