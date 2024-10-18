import 'package:equatable/equatable.dart';
import 'package:pdf_app/app/features/directory_add/model/directory_model.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/view/features/home_directory_open/model/all_pdf_model.dart';

class EditDirectoryState with EquatableMixin {
  EditDirectoryState({
    this.status = EditDirectoryStatus.start,
    this.allPdfStatus = EditDirectoryAllPdfStatus.start,
    this.allPdfSnackBarStatus = EditDirectoryAllPdfSnackBarStatus.initial,
    this.allDirectoryStatus = EditDirectoryAllDirectoryStatus.initial,
    this.selectedDirectory,
    this.allPdfModel,
  });

  final EditDirectoryStatus status;

  final DirectoryModel? selectedDirectory;

  final AllPdfModel? allPdfModel;

  final EditDirectoryAllPdfStatus allPdfStatus;

  final EditDirectoryAllPdfSnackBarStatus allPdfSnackBarStatus;

  final EditDirectoryAllDirectoryStatus allDirectoryStatus;

  @override
  List<Object?> get props => [
        status,
        selectedDirectory,
        allPdfModel,
        allPdfStatus,
        allPdfSnackBarStatus,
        allDirectoryStatus,
      ];

  EditDirectoryState copyWith({
    EditDirectoryStatus? status,
    DirectoryModel? selectedDirectory,
    AllPdfModel? allPdfModel,
    EditDirectoryAllPdfStatus? allPdfStatus,
    EditDirectoryAllPdfSnackBarStatus? allPdfSnackBarStatus,
    EditDirectoryAllDirectoryStatus? allDirectoryStatus,
  }) =>
      EditDirectoryState(
        status: status ?? this.status,
        selectedDirectory: selectedDirectory ?? this.selectedDirectory,
        allPdfModel: allPdfModel ?? this.allPdfModel,
        allPdfStatus: allPdfStatus ?? this.allPdfStatus,
        allPdfSnackBarStatus: allPdfSnackBarStatus ?? this.allPdfSnackBarStatus,
        allDirectoryStatus: allDirectoryStatus ?? this.allDirectoryStatus,
      );
}

enum EditDirectoryStatus {
  start,
  initial,
  loading,
  error,
}

enum EditDirectoryAllPdfStatus {
  start,
  initial,
  loading,
  error,
}

enum EditDirectoryAllPdfSnackBarStatus {
  initial,
  success,
  error,
}

enum EditDirectoryAllDirectoryStatus {
  initial,
  success,
  alreadyExist,
  error,
}
