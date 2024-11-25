import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/pdf_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/all_pdf_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/edit_directory/bloc/edit_directory_state.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_directory_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_pdf_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/directory_operation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';

part 'edit_directory_cubit_mixin.dart';

class EditDirectoryCubit extends Cubit<EditDirectoryState>
    with _EditDirectoryCubitMixin {
  EditDirectoryCubit(this.selectedDirectory)
      : _directoryNameController = TextEditingController(
          text: selectedDirectory?.name ?? '',
        ),
        super(
          EditDirectoryState(
            selectedDirectory: selectedDirectory,
          ),
        );

  final DirectoryModel? selectedDirectory;

  final TextEditingController _directoryNameController;

  TextEditingController get directoryNameController => _directoryNameController;

  final AllPdfOperation _allPdfOperation =
      GetItManager.getIt<AllPdfOperation>();

  final AllDirectoryOperation _allDirectoryOperation =
      GetItManager.getIt<AllDirectoryOperation>();

  final DirectoryOperation _directoryOperation =
      GetItManager.getIt<DirectoryOperation>();

  int? get fileListKey => selectedDirectory?.fileListKey;

  String? get selectedDirectoryKey => selectedDirectory?.key;


  Future<void> initDatabase() async {
    final int? fileListKey = selectedDirectory?.fileListKey;

    emit(
      state.copyWith(
        allPdfStatus: EditDirectoryAllPdfStatus.loading,
      ),
    );
    if (fileListKey == null || selectedDirectory == null) {
      emit(
        state.copyWith(
          allPdfStatus: EditDirectoryAllPdfStatus.error,
        ),
      );
    } else {
      await _allPdfOperation.start(fileListKey.toString());
      await _directoryOperation.start(selectedDirectoryKey!);
      await _allDirectoryOperation.start(AllDirectoryModel.allDirectoryKey);
      _getPdfList();
    }
  }

  AllPdfModel? _getAllPdfModel() {
    return _allPdfOperation.getItem(fileListKey!.toString());
  }

  Future<void> _getPdfList() async {
    final AllPdfModel? allPdfModel = _getAllPdfModel();
    if (allPdfModel?.allFiles == null) {
      await _createFirstModel();
      _getPdfList();
    } else {
      emit(
        state.copyWith(
          allPdfModel: allPdfModel,
          allPdfStatus: EditDirectoryAllPdfStatus.initial,
          status: EditDirectoryStatus.initial,
        ),
      );

      print('data: ${state.allPdfModel}');
    }
  }

  Future<void> _createFirstModel() async {
    await _allPdfOperation.addOrUpdateItem(
      AllPdfModel(
        id: fileListKey,
        allFiles: [],
      ),
    );
  }

  Future<void> deletePdfFromHive(PdfModel? pdfModel) async {
    emit(
      state.copyWith(
        allPdfStatus: EditDirectoryAllPdfStatus.loading,
      ),
    );
    final AllPdfModel allPdfModel = state.allPdfModel!;

    final List<PdfModel?> mutableList = List<PdfModel>.from(
      allPdfModel.allFiles!,
    );

    mutableList.remove(pdfModel);

    final newAllPdfModel = allPdfModel.copyWith(
      allFiles: mutableList,
    );

    await _allPdfOperation.addOrUpdateItem(newAllPdfModel);

    emit(
      state.copyWith(
        allPdfStatus: EditDirectoryAllPdfStatus.initial,
        allPdfSnackBarStatus: EditDirectoryAllPdfSnackBarStatus.success,
        allPdfModel: newAllPdfModel,
      ),
    );

    resetAllPdfSnackBarStatus();
  }

  Future<void> updateDirectory() async {
    emit(
      state.copyWith(
        status: EditDirectoryStatus.loading,
      ),
    );


    final DirectoryModel updatedDirectoryModel = selectedDirectory!.copyWith(
      name: _directoryNameController.text,
    );

    AllDirectoryModel? allDirectoryModel = _getAllDirectoryModel();

    List<DirectoryModel?>? directoryList = allDirectoryModel?.allDirectory;

    if (directoryList == null) {
      emit(
        state.copyWith(
          status: EditDirectoryStatus.error,
        ),
      );
      return;
    }

    print(directoryList);
    print(updatedDirectoryModel);

    if (isDuplicate(directoryList, updatedDirectoryModel)) {
      emit(
        state.copyWith(
          allDirectoryStatus: EditDirectoryAllDirectoryStatus.alreadyExist,
        ),
      );
    } else {

      final List<DirectoryModel?> updatedList = [
        updatedDirectoryModel,
        ...directoryList.where((model) => model?.id != updatedDirectoryModel.id),
      ];

      final AllDirectoryModel newDirectoryModel = allDirectoryModel!.copyWith(
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

  void resetAllPdfSnackBarStatus() {
    emit(
      state.copyWith(
        allPdfSnackBarStatus: EditDirectoryAllPdfSnackBarStatus.initial,
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
