import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/pdf/all_pdf_model.dart';
import 'package:DocuSort/app/product/model/file/all_file/all_file_base_model.dart';
import 'package:equatable/equatable.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';

class EditDirectoryState with EquatableMixin {
  EditDirectoryState({
    this.status = EditDirectoryStatus.start,
    this.allFileStatus = EditDirectoryAllFileStatus.start,
    this.allFileSnackBarStatus = EditDirectoryAllFileSnackBarStatus.initial,
    this.allDirectoryStatus = EditDirectoryAllDirectoryStatus.initial,
    this.selectedDirectory,
    this.allFileExtendBaseModel,
  });

  final EditDirectoryStatus status;

  final DirectoryModel? selectedDirectory;

  final AllFileExtendBaseModel? allFileExtendBaseModel;

  final EditDirectoryAllFileStatus allFileStatus;

  final EditDirectoryAllFileSnackBarStatus allFileSnackBarStatus;

  final EditDirectoryAllDirectoryStatus allDirectoryStatus;

  @override
  List<Object?> get props => [
        status,
        selectedDirectory,
    allFileExtendBaseModel,
    allFileStatus,
    allFileSnackBarStatus,
        allDirectoryStatus,
      ];

  EditDirectoryState copyWith({
    EditDirectoryStatus? status,
    DirectoryModel? selectedDirectory,
    AllFileExtendBaseModel? allFileExtendBaseModel,
    EditDirectoryAllFileStatus? allFileStatus,
    EditDirectoryAllFileSnackBarStatus? allFileSnackBarStatus,
    EditDirectoryAllDirectoryStatus? allDirectoryStatus,
  }) =>
      EditDirectoryState(
        status: status ?? this.status,
        selectedDirectory: selectedDirectory ?? this.selectedDirectory,
        allFileExtendBaseModel: allFileExtendBaseModel ?? this.allFileExtendBaseModel,
        allFileStatus: allFileStatus ?? this.allFileStatus,
        allFileSnackBarStatus: allFileSnackBarStatus ?? this.allFileSnackBarStatus,
        allDirectoryStatus: allDirectoryStatus ?? this.allDirectoryStatus,
      );
}

enum EditDirectoryStatus {
  start,
  initial,
  loading,
  error,
}

enum EditDirectoryAllFileStatus {
  start,
  initial,
  loading,
  error,
}

enum EditDirectoryAllFileSnackBarStatus {
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
