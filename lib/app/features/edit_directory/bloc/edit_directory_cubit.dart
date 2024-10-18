import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_app/app/features/directory_add/model/directory_model.dart';
import 'package:pdf_app/app/features/edit_directory/bloc/edit_directory_state.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/model/all_directory_model.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/model/pdf_model.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/view/features/home_directory_open/model/all_pdf_model.dart';
import 'package:pdf_app/app/product/cache/hive/operation/all_directory_operation.dart';
import 'package:pdf_app/app/product/cache/hive/operation/all_pdf_operation.dart';
import 'package:pdf_app/app/product/cache/hive/operation/directory_operation.dart';
import 'package:pdf_app/app/product/manager/getIt/getIt_manager.dart';

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

  int? get pdfListKey => selectedDirectory?.pdfListKey;

  String? get selectedDirectoryKey => selectedDirectory?.key;


  Future<void> initDatabase() async {
    final int? pdfListKey = selectedDirectory?.pdfListKey;

    emit(
      state.copyWith(
        allPdfStatus: EditDirectoryAllPdfStatus.loading,
      ),
    );
    if (pdfListKey == null || selectedDirectory == null) {
      emit(
        state.copyWith(
          allPdfStatus: EditDirectoryAllPdfStatus.error,
        ),
      );
    } else {
      await _allPdfOperation.start(pdfListKey.toString());
      await _directoryOperation.start(selectedDirectoryKey!);
      await _allDirectoryOperation.start(AllDirectoryModel.allDirectoryKey);
      _getPdfList();
    }
  }

  AllPdfModel? _getAllPdfModel() {
    return _allPdfOperation.getItem(pdfListKey!.toString());
  }

  Future<void> _getPdfList() async {
    final AllPdfModel? allPdfModel = _getAllPdfModel();
    if (allPdfModel?.allPdf == null) {
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
        id: pdfListKey,
        allPdf: [],
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
      allPdfModel.allPdf!,
    );

    mutableList.remove(pdfModel);

    final newAllPdfModel = allPdfModel.copyWith(
      allPdf: mutableList,
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

    print('new name');
    print(_directoryNameController.text);

    final DirectoryModel updatedDirectoryModel = selectedDirectory!.copyWith(
      name: _directoryNameController.text,
    );

    final AllDirectoryModel? allDirectoryModel = _getAllDirectoryModel();

    final List<DirectoryModel?>? directoryList =
        allDirectoryModel?.allDirectory;

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
      print('bu zaten var');
      emit(
        state.copyWith(
          allDirectoryStatus: EditDirectoryAllDirectoryStatus.alreadyExist,
        ),
      );
    } else {
      print('değişti');
      await _directoryOperation.addOrUpdateItem(
        updatedDirectoryModel,
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
