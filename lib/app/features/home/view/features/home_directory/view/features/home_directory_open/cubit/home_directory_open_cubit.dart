import 'package:DocuSort/app/features/home/view/features/home_directory/model/pdf_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/cubit/home_directory_open_state.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/cubit/repository/pdf_repository.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/all_pdf_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_pdf_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/home_directory_open_page_layout_operation.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/enum/page_layout_enum.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/file/file/file_base_model.dart';
import 'package:DocuSort/app/product/model/page_layout/home_directory_open_layout_model/home_directory_open_page_layout_model.dart';
import 'package:DocuSort/app/product/package/uuid/id_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDirectoryOpenCubit extends Cubit<HomeDirectoryOpenState> {
  HomeDirectoryOpenCubit(
      this.fileListKey, this.fileTypeEnum, this._pdfRepository)
      : super(HomeDirectoryOpenState());

  final int? fileListKey;
  final FileTypeEnum fileTypeEnum;

  int? get getFileListKey => fileListKey;

  final PdfRepository _pdfRepository;

  final AllPdfOperation _allPdfOperation =
      GetItManager.getIt<AllPdfOperation>();

  final HomeDirectoryOpenPageLayoutOperation _homeDirectoryPageLayoutOperation =
      GetItManager.getIt<HomeDirectoryOpenPageLayoutOperation>();

  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        status: HomeDirectoryOpenStatus.loading,
      ),
    );

    await _homeDirectoryPageLayoutOperation.start(
      HomeDirectoryOpenPageLayoutModel.homeDirectoryOpenLayoutKey,
    );

    final homeOpenDirectoryLayout = _homeDirectoryPageLayoutOperation.getItem(
      HomeDirectoryOpenPageLayoutModel.homeDirectoryOpenLayoutKey,
    );

    if (fileListKey == null) {
      emit(
        state.copyWith(
          status: HomeDirectoryOpenStatus.error,
        ),
      );
    } else {
      if (homeOpenDirectoryLayout == null) {
        homeOpenDirectoryLayout == null ? await createFirstLayoutModel() : null;
        initDatabase();
      } else {
        updateHomeOpenLayoutState(homeOpenDirectoryLayout);
        switch (fileTypeEnum) {
          case FileTypeEnum.pdf:
            await _initPdfFile();
        }
      }
    }
  }

  Future<void> createFirstLayoutModel() async {
    await _homeDirectoryPageLayoutOperation.addOrUpdateItem(
      HomeDirectoryOpenPageLayoutModel(
        id: IdGenerator.randomIntId,
        pageLayoutEnum: PageLayoutEnum.list,
      ),
    );
  }

  void updateHomeOpenLayoutState(HomeDirectoryOpenPageLayoutModel layoutModel) {
    emit(
      state.copyWith(
        pageLayoutModel: layoutModel,
      ),
    );
  }

  void updateHomeOpenLayout(PageLayoutEnum? layoutEnum) {
    if (layoutEnum == null) return;
    final newPageLayoutModel = state.pageLayoutModel!.copyWith(
      pageLayoutEnum: layoutEnum,
    );
    _homeDirectoryPageLayoutOperation.addOrUpdateItem(newPageLayoutModel);
    emit(
      state.copyWith(pageLayoutModel: newPageLayoutModel),
    );
  }

  Future<void> deleteFileList(FileExtendBaseModel fileModel) async {
    switch (fileTypeEnum) {
      case FileTypeEnum.pdf:
        if (fileModel is! PdfModel) return;
        await deletePdfFromDirectory(fileModel);
    }
  }

  Future<void> _initPdfFile() async {
    await _allPdfOperation.start(fileListKey.toString());
    await _getPdfList();
  }

  Future<void> _getPdfList() async {
    final AllPdfModel? allPdfModel = _pdfRepository.getAllPdfModel();
    if (allPdfModel?.allFiles == null) {
      await _pdfRepository.createFirstModel();
      _getPdfList();
    } else {
      emit(
        state.copyWith(
          allFileModel: allPdfModel,
          status: HomeDirectoryOpenStatus.initial,
        ),
      );

      print('data: ${state.allFileModel}');
    }
  }

  Future<void> deletePdfFromDirectory(PdfModel pdfModel) async {
    final allPdfModel = state.allFileModel;
    if (allPdfModel is! AllPdfModel) return;

    final pdfList = allPdfModel.allFiles;

    if (pdfList == null) return;
    final List<PdfModel> mutablePdfList = List<PdfModel>.from(pdfList);
    mutablePdfList.remove(pdfModel);
    final newAllPdfModel = allPdfModel.copyWith(
      allFiles: mutablePdfList,
    );

    _pdfRepository.deletePdfFromDirectory(newAllPdfModel);

    emit(
      state.copyWith(
        snackBarStatus: HomeDirectoryOpenSnackBarStatus.deletedSuccess,
        allFileModel: newAllPdfModel,
      ),
    );
    resetSnackBarStatus();
  }

  void resetSnackBarStatus() {
    emit(
      state.copyWith(
        snackBarStatus: HomeDirectoryOpenSnackBarStatus.initial,
      ),
    );
  }
}
