import 'package:equatable/equatable.dart';
import 'package:pdf_app/app/features/home/view/features/homePdf/model/all_directory_model.dart';

class HomePdfState with EquatableMixin {
  HomePdfState({
    this.status = HomePdfStatus.start,
    this.allDirectory,
  });

  final HomePdfStatus status;
  final AllDirectoryModel? allDirectory;

  @override
  List<Object?> get props => [status, allDirectory];

  HomePdfState copyWith(
          {HomePdfStatus? status, AllDirectoryModel? allDirectory}) =>
      HomePdfState(
        status: status ?? this.status,
        allDirectory: allDirectory ?? this.allDirectory,
      );
}

enum HomePdfStatus {
  start,
  initial,
  error,
  loading,
}
