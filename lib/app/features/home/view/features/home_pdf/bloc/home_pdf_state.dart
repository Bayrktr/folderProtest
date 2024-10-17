import 'package:equatable/equatable.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/model/all_directory_model.dart';

class HomePdfState with EquatableMixin {
  HomePdfState({
    this.status = HomePdfStatus.start,
    this.allDirectory,
    this.snackBarStatus = HomePdfSnackBarStatus.inital,
  });

  final HomePdfStatus status;
  final AllDirectoryModel? allDirectory;
  final HomePdfSnackBarStatus snackBarStatus;

  @override
  List<Object?> get props => [status, allDirectory, snackBarStatus];

  HomePdfState copyWith(
          {HomePdfStatus? status,
          AllDirectoryModel? allDirectory,
          HomePdfSnackBarStatus? snackBarStatus}) =>
      HomePdfState(
        status: status ?? this.status,
        allDirectory: allDirectory ?? this.allDirectory,
        snackBarStatus: snackBarStatus ?? this.snackBarStatus,
      );
}

enum HomePdfStatus {
  start,
  initial,
  error,
  loading,
}

enum HomePdfSnackBarStatus {
  inital,
  deletedSuccess,

}
