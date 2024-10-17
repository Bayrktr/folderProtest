import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_app/app/core/extention/string/string_extention.dart';
import 'package:pdf_app/app/features/add_pdf/bloc/add_pdf_cubit_mixin.dart';
import 'package:pdf_app/app/features/add_pdf/bloc/add_pdf_state.dart';
import 'package:pdf_app/app/features/directory_add/model/directory_model.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/model/pdf_model.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/view/features/home_directory_open/model/all_pdf_model.dart';
import 'package:pdf_app/app/product/cache/hive/operation/all_pdf_operation.dart';
import 'package:pdf_app/app/product/manager/file_picker/file_picker_manager.dart';
import 'package:pdf_app/app/product/manager/getIt/getIt_manager.dart';
import 'package:pdf_app/app/product/package/uuid/id_generator.dart';

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

  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        status: AddPdfStatus.loading,
      ),
    );
    if(directoryModel?.pdfListKey == null){
      emit(state.copyWith(status: AddPdfStatus.error,),);
    }else{
      print(directoryModel!.pdfListKey);
      await _allPdfOperation.start(directoryModel!.pdfListKey.toString());
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
          savePdfStatus: SavePdfStatus.fileError,
        ),
      );
    }
    _resetSavePdfStatus();
  }

  void _resetSavePdfStatus() {
    emit(
      state.copyWith(
        savePdfStatus: SavePdfStatus.initial,
      ),
    );
  }

  Future<void> savePdfToDirectory() async {
    emit(
      state.copyWith(
        status: AddPdfStatus.loading,
      ),
    );
    final newPdfModel = PdfModel(
      id: IdGenerator.randomIntId,
      name: pdfNameController.text,
      path: state.pickFileResult?.files.first.path,
    );
    final AllPdfModel? allPdfModel = _getPdfList();
    if (allPdfModel == null) {
      emit(
        state.copyWith(
          status: AddPdfStatus.error,
        ),
      );
      return;
    }

    final mutableAllPdf = List<PdfModel>.from(allPdfModel.allPdf ?? []);

    if (!isAlreadyExist(mutableAllPdf, newPdfModel)) {
      mutableAllPdf.insert(0, newPdfModel);
      await _allPdfOperation.addOrUpdateItem(
        allPdfModel.copyWith(
          allPdf: mutableAllPdf,
        ),
      );
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
  }

  AllPdfModel? _getPdfList() {
    final AllPdfModel? allPdfModel =
        _allPdfOperation.getItem(directoryModel!.pdfListKey.toString());
    return allPdfModel;
  }
}
