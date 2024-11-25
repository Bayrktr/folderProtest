import 'package:DocuSort/app/product/model/file/all_file/all_file_base_model.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';

class EditPdfState with EquatableMixin {
  EditPdfState({
    this.status = EditPdfStatus.start,
    this.allFileModel,
    this.savePdfStatus = SavePdfStatus.initial,
  });

  final EditPdfStatus status;
  final AllFileExtendBaseModel? allFileModel;

  final SavePdfStatus savePdfStatus;

  @override
  List<Object?> get props => [
        status,
        allFileModel,
    savePdfStatus,
      ];

  EditPdfState copyWith({
    EditPdfStatus? status,
    AllFileExtendBaseModel? allFileModel,
    FilePickerResult? pickFileResult,
    SavePdfStatus? savePdfStatus,
  }) =>
      EditPdfState(
        status: status ?? this.status,
        allFileModel: allFileModel ?? this.allFileModel,
        savePdfStatus: savePdfStatus ?? this.savePdfStatus,
      );
}

enum EditPdfStatus {
  start,
  initial,
  loading,
  error,
  finish,
}

enum SavePdfStatus {
  initial,
  alreadyExist,
  success,
}
