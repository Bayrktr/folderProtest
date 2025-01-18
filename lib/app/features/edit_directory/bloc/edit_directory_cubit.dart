import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/edit_directory/bloc/edit_directory_repository.dart';
import 'package:DocuSort/app/features/edit_directory/bloc/edit_directory_state.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/pdf/all_pdf_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_directory_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_pdf_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/directory_operation.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/model/file/all_file/all_file_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'edit_directory_cubit_mixin.dart';

class EditDirectoryCubit extends Cubit<EditDirectoryState>
    with _EditDirectoryCubitMixin {
  EditDirectoryCubit(this.selectedDirectory, this._editDirectoryRepository)
      : _directoryNameController = TextEditingController(
          text: selectedDirectory?.name ?? '',
        ),
        super(
          EditDirectoryState(
            selectedDirectory: selectedDirectory,
          ),
        );

  final EditDirectoryRepository _editDirectoryRepository;

  final BaseDirectoryModel? selectedDirectory;

  final TextEditingController _directoryNameController;

  TextEditingController get directoryNameController => _directoryNameController;

  final AllDirectoryOperation _allDirectoryOperation =
      GetItManager.getIt<AllDirectoryOperation>();

  final DirectoryOperation _directoryOperation =
      GetItManager.getIt<DirectoryOperation>();

  FileTypeEnum? get _fileTypeEnum => selectedDirectory?.fileTypeEnum;

  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        allFileStatus: EditDirectoryAllFileStatus.loading,
      ),
    );
    if (_editDirectoryRepository.selectedDirectoryModel == null ||
        _editDirectoryRepository.fileListKey == null) {
      emit(
        state.copyWith(
          allFileStatus: EditDirectoryAllFileStatus.error,
        ),
      );
    } else {
      await _editDirectoryRepository.initDatabase();
      _getFileList();
    }
  }

  void _getFileList() async {
    AllFileExtendBaseModel? allFileExtendBaseModel;

    switch (_fileTypeEnum!) {
      case FileTypeEnum.pdf:
        allFileExtendBaseModel =
            _editDirectoryRepository.pdfRepository.getAllPdfModel();
    }

    emit(
      state.copyWith(
        status: EditDirectoryStatus.initial,
        allFileStatus: EditDirectoryAllFileStatus.initial,
        allFileExtendBaseModel: allFileExtendBaseModel,
      ),
    );
  }

  Future<void> deleteFileFromDirectory(FileExtendBaseModel? fileModel) async {
    if (fileModel == null) return;
    emit(
      state.copyWith(
        allFileStatus: EditDirectoryAllFileStatus.loading,
      ),
    );

    AllFileExtendBaseModel allFileModel = state.allFileExtendBaseModel!;

    switch (_fileTypeEnum!) {
      case FileTypeEnum.pdf:
        allFileModel = allFileModel as AllPdfModel;

        final List<PdfModel?> mutableList = List<PdfModel>.from(
          allFileModel.allFiles!,
        );

        mutableList.remove(fileModel as PdfModel);

        allFileModel = allFileModel.copyWith(
          allFiles: mutableList,
        );
        await _editDirectoryRepository.pdfRepository.deletePdfFromDirectory(
          allFileModel,
        );
    }

    emit(
      state.copyWith(
        allFileStatus: EditDirectoryAllFileStatus.initial,
        allFileSnackBarStatus: EditDirectoryAllFileSnackBarStatus.success,
        allFileExtendBaseModel: allFileModel,
      ),
    );

    resetAllFileSnackBarStatus();
  }

  Future<void> updateDirectory() async {
    emit(
      state.copyWith(
        status: EditDirectoryStatus.loading,
      ),
    );

    final updatedDirectoryModel = selectedDirectory!.copyWith(
      name: _directoryNameController.text,
    );

    final allDirectoryModel = _getAllDirectoryModel();

    final directoryList = allDirectoryModel?.allDirectory;

    if (directoryList == null) {
      emit(
        state.copyWith(
          status: EditDirectoryStatus.error,
        ),
      );
      return;
    }

    if (isDuplicate(directoryList, updatedDirectoryModel)) {
      emit(
        state.copyWith(
          allDirectoryStatus: EditDirectoryAllDirectoryStatus.alreadyExist,
        ),
      );
    } else {
      final updatedList = <BaseDirectoryModel?>[
        updatedDirectoryModel,
        ...directoryList
            .where((model) => model?.id != updatedDirectoryModel.id),
      ];

      final newDirectoryModel = allDirectoryModel!.copyWith(
        allDirectory: updatedList,
      );

      await _allDirectoryOperation.addOrUpdateItem(
        newDirectoryModel,
      );
      emit(
        state.copyWith(
          allDirectoryStatus: EditDirectoryAllDirectoryStatus.success,
        ),
      );
    }

    emit(
      state.copyWith(
        status: EditDirectoryStatus.initial,
      ),
    );
    resetAllDirectoryStatus();
  }

  AllDirectoryModel? _getAllDirectoryModel() {
    return _allDirectoryOperation.getItem(AllDirectoryModel.allDirectoryKey);
  }

  void editDirectoryName(String? value) {
    if (value == null) return;
    _directoryNameController.text = value;
  }

  void resetAllFileSnackBarStatus() {
    emit(
      state.copyWith(
        allFileSnackBarStatus: EditDirectoryAllFileSnackBarStatus.initial,
      ),
    );
  }

  void resetAllDirectoryStatus() {
    emit(
      state.copyWith(
        allDirectoryStatus: EditDirectoryAllDirectoryStatus.initial,
      ),
    );
  }
}
