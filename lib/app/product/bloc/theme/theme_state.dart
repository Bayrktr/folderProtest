import 'package:equatable/equatable.dart';
import 'package:pdf_app/app/product/model/theme/theme_model.dart';

class ThemeState with EquatableMixin {
  ThemeState({
    this.status = ThemeStatus.start,
    required this.theme,
  });

  final ThemeModel theme;

  final ThemeStatus status;

  @override
  List<Object?> get props => [
        theme,
        status,
      ];

  ThemeState copyWith({
    ThemeModel? theme,
    ThemeStatus? status,
  }) =>
      ThemeState(
        theme: theme ?? this.theme,
        status: status ?? this.status,
      );
}

enum ThemeStatus {
  initial,
  start,
}
