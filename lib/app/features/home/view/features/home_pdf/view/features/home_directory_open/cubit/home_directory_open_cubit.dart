import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/model/pdf_model.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/view/features/home_directory_open/cubit/home_directory_open_state.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/view/features/home_directory_open/model/all_pdf_model.dart';
import 'package:pdf_app/app/product/cache/hive/operation/all_pdf_operation.dart';
import 'package:pdf_app/app/product/manager/getIt/getIt_manager.dart';

class HomeDirectoryOpenCubit extends Cubit<HomeDirectoryOpenState> {
  HomeDirectoryOpenCubit(this.pdfListKey) : super(HomeDirectoryOpenState());

  final int? pdfListKey;

  final AllPdfOperation _allPdfOperation =
  GetItManager.getIt<AllPdfOperation>();

  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        status: HomeDirectoryOpenStatus.loading,
      ),
    );
    if (pdfListKey == null) {
      emit(
        state.copyWith(
          status: HomeDirectoryOpenStatus.error,
        ),
      );
    } else {
      await _allPdfOperation.start(pdfListKey.toString());
      _getPdfList();
    }
  }

  Future<void> _getPdfList() async {
    final AllPdfModel? allPdfModel = _getAllPdfModel();
    if (allPdfModel?.allPdf == null) {
      await createFirstModel();
      _getPdfList();
    } else {
      emit(
        state.copyWith(
          allPdfModel: allPdfModel,
          status: HomeDirectoryOpenStatus.initial,
        ),
      );

      print('data: ${state.allPdfModel}');
    }
  }

  Future<void> createFirstModel() async {
    await _allPdfOperation.addOrUpdateItem(
      AllPdfModel(
        id: pdfListKey,
        allPdf: [],
      ),
    );
  }

  Future<void> deletePdfFromDirectory(PdfModel pdfModel) async {
    final allPdfModel = state.allPdfModel;
    final pdfList = allPdfModel?.allPdf;

    if (pdfList == null) return;
    final List<PdfModel> mutablePdfList = List<PdfModel>.from(pdfList);
    mutablePdfList.remove(pdfModel);
    final newAllPdfModel = allPdfModel!.copyWith(
      allPdf: mutablePdfList,
    );

    await _allPdfOperation.addOrUpdateItem(
      newAllPdfModel,
    );
    emit(
      state.copyWith(
        snackBarStatus: HomeDirectoryOpenSnackBarStatus.deletedSuccess,
        allPdfModel: newAllPdfModel,
      ),
    );
    resetSnackBarStatus();
  }

  AllPdfModel? _getAllPdfModel() {
    return _allPdfOperation.getItem(pdfListKey.toString());
  }

  void resetSnackBarStatus() {
    emit(
      state.copyWith(
        snackBarStatus: HomeDirectoryOpenSnackBarStatus.initial,
      ),
    );
  }
}
