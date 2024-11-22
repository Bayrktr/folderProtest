import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';

class AddPdfState with EquatableMixin {
  AddPdfState({
    this.status = AddPdfStatus.start,
    this.savePdfStatus = SavePdfStatus.initial,
    this.selectedDirectory,
    this.pickFileResult,
  });

  final AddPdfStatus status;
  final SavePdfStatus savePdfStatus;
  final DirectoryModel? selectedDirectory;
  final FilePickerResult? pickFileResult;

  @override
  List<Object?> get props => [
        status,
        savePdfStatus,
        selectedDirectory,
        pickFileResult,
      ];

  AddPdfState copyWith({
    AddPdfStatus? status,
    SavePdfStatus? savePdfStatus,
    DirectoryModel? selectedDirectory,
    FilePickerResult? pickFileResult,
  }) =>
      AddPdfState(
        status: status ?? this.status,
        savePdfStatus: savePdfStatus ?? this.savePdfStatus,
        selectedDirectory: selectedDirectory ?? this.selectedDirectory,
        pickFileResult: pickFileResult ?? this.pickFileResult,
      );
}

enum AddPdfStatus {
  start,
  initial,
  loading,
  error,
  finish,
}

enum SavePdfStatus {
  initial,
  fileError,
  alreadyExist,
  wrongFileType,
  empty,
  success,
}
