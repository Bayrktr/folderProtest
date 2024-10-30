import 'package:equatable/equatable.dart';
import 'package:DocuSort/app/features/home/view/features/home_pdf/view/features/home_directory_open/model/all_pdf_model.dart';

class HomeDirectoryOpenState with EquatableMixin {
  HomeDirectoryOpenState({
    this.status = HomeDirectoryOpenStatus.start,
    this.snackBarStatus = HomeDirectoryOpenSnackBarStatus.initial,
    this.allPdfModel,
  });

  final HomeDirectoryOpenStatus status;
  final HomeDirectoryOpenSnackBarStatus snackBarStatus;
  final AllPdfModel? allPdfModel;

  @override
  List<Object?> get props => [status, snackBarStatus, allPdfModel];

  HomeDirectoryOpenState copyWith({
    HomeDirectoryOpenStatus? status,
    HomeDirectoryOpenSnackBarStatus? snackBarStatus,
    AllPdfModel? allPdfModel,
  }) =>
      HomeDirectoryOpenState(
        status: status ?? this.status,
        snackBarStatus: snackBarStatus ?? this.snackBarStatus,
        allPdfModel: allPdfModel ?? this.allPdfModel,
      );
}

enum HomeDirectoryOpenStatus {
  start,
  initial,
  loading,
  error,
}

enum HomeDirectoryOpenSnackBarStatus {
  initial,
  deletedSuccess,
}
