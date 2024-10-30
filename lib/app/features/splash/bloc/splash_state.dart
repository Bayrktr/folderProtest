import 'package:equatable/equatable.dart';

class SplashState with EquatableMixin {
  SplashState({this.status = SplashStatus.start});

  final SplashStatus status;

  @override
  List<Object?> get props => [status];

  SplashState copyWith({SplashStatus? status}) => SplashState(
        status: status ?? this.status,
      );
}

enum SplashStatus {
  start,
  error,
  finish,
}
