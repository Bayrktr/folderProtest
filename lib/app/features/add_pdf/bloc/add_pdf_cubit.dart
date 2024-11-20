import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/add_pdf/bloc/add_pdf_cubit_mixin.dart';
import 'package:DocuSort/app/features/add_pdf/bloc/add_pdf_state.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/pdf_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_pdf_operation.dart';
import 'package:DocuSort/app/product/manager/file_picker/file_picker_manager.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/view/features/home_directory/view/features/home_directory_open/model/all_pdf_model.dart';

class AddPdfCubit extends Cubit<AddPdfState> with AddPdfCubitMixin {
  AddPdfCubit({this.directoryModel})
      : super(
          AddPdfState(
            selectedDirectory: directoryModel,
          ),
        );

  final DirectoryModel? directoryModel;

  final TextEditingController _pdfNameController = TextEditingController();

  TextEditingController get pdfNameController => _pdfNameController;

  final AllPdfOperation _allPdfOperation =
      GetItManager.getIt<AllPdfOperation>();

  String? get fileListKey => directoryModel?.fileListKey.toString();


  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        status: AddPdfStatus.loading,
      ),
    );
    if (fileListKey == null) {
      emit(
        state.copyWith(
          status: AddPdfStatus.error,
        ),
      );
    } else {
      await _allPdfOperation.start(fileListKey!);
      emit(
        state.copyWith(
          status: AddPdfStatus.initial,
        ),
      );
    }
  }

  void updatePdfName(String? value) {
    if (value == null) return;
    _pdfNameController.text = value;
  }

  Future<void> pickPdf() async {
    emit(
      state.copyWith(
        status: AddPdfStatus.loading,
      ),
    );
    final result = await FilePickerManager.pickFile();
    if (result != null) {
      if (pdfNameController.text == '') {
        pdfNameController.text = result.files.first.name.general.removeAfterDot;
      }

      emit(
        state.copyWith(
          pickFileResult: result,
          status: AddPdfStatus.initial,
        ),
      );
    } else {
      emit(
        state.copyWith(
          status: AddPdfStatus.initial,
        ),
      );
    }
  }

  void _resetSavePdfStatus() {
    emit(
      state.copyWith(
        savePdfStatus: SavePdfStatus.initial,
      ),
    );
  }

  Future<void> savePdfToDirectory() async {
    if (state.pickFileResult == null) {
      emit(
        state.copyWith(
          savePdfStatus: SavePdfStatus.fileError,
        ),
      );
      return;
    }

    try {
      emit(
        state.copyWith(
          status: AddPdfStatus.loading,
        ),
      );

      final newPdfModel = PdfModel(
        id: IdGenerator.randomIntId,
        name: pdfNameController.text,
        byte: state.pickFileResult?.files.first.bytes,
      );

      AllPdfModel? allPdfModel = await Future.microtask(() => _getPdfList());

      if (allPdfModel == null) {
        await _createFirstModel();
        allPdfModel = await Future.microtask(() => _getPdfList());
      }

      final mutableAllPdf = List<PdfModel>.from(allPdfModel?.allFiles ?? []);

      if (!isAlreadyExist(mutableAllPdf, newPdfModel)) {
        mutableAllPdf.insert(0, newPdfModel);

        await Future.microtask(() => _allPdfOperation.addOrUpdateItem(
              allPdfModel!.copyWith(
                allFiles: mutableAllPdf,
              ),
            ));

        emit(
          state.copyWith(
            status: AddPdfStatus.initial,
            savePdfStatus: SavePdfStatus.success,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AddPdfStatus.initial,
            savePdfStatus: SavePdfStatus.alreadyExist,
          ),
        );
      }

    } catch (e) {
      print("Error saving PDF: $e");
      emit(state.copyWith(status: AddPdfStatus.error));
    }

    _resetSavePdfStatus();

  }

  AllPdfModel? _getPdfList() {
    return _allPdfOperation.getItem(directoryModel!.fileListKey.toString());
  }

  Future<void> _createFirstModel() async {
    await _allPdfOperation.addOrUpdateItem(
      AllPdfModel(
        id: int.parse(fileListKey!),
        allFiles: [],
      ),
    );
  }
}
