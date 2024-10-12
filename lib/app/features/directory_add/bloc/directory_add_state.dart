import 'package:equatable/equatable.dart';

class DirectoryAddState with EquatableMixin {
  DirectoryAddState({
    this.status = DirectoryAddStatus.start,
    this.statusMessage,
    this.popUpStatus = DirectoryAddPopUpStatus.initial,
    this.popUpStatusMessage,
  });

  final DirectoryAddStatus status;
  final String? statusMessage;
  final DirectoryAddPopUpStatus popUpStatus;
  final String? popUpStatusMessage;

  @override
  List<Object?> get props => [
        status,
        statusMessage,
        popUpStatus,
        popUpStatusMessage,
      ];

  DirectoryAddState copyWith({
    DirectoryAddStatus? status,
    String? statusMessage,
    DirectoryAddPopUpStatus? popUpStatus,
    String? popUpStatusMessage,
  }) =>
      DirectoryAddState(
        status: status ?? this.status,
        statusMessage: statusMessage ?? this.statusMessage,
        popUpStatus: popUpStatus ?? this.popUpStatus,
        popUpStatusMessage: popUpStatusMessage ?? this.popUpStatusMessage,
      );
}

enum DirectoryAddStatus {
  start,
  initial,
  loading,
  error,
  finish,
}

enum DirectoryAddPopUpStatus {
  initial,
  show,
}
