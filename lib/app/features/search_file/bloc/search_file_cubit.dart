import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/product/repository/file/pdf_repository.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/pdf/all_pdf_model.dart';
import 'package:DocuSort/app/features/search_file/bloc/search_file_state.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFileCubit extends Cubit<SearchFileState> {
  SearchFileCubit(this._pdfRepository, this._directoryModel)
      : super(SearchFileState());

  final PdfRepository _pdfRepository;

  final DirectoryModel? _directoryModel;

  int? get fileListKey => _directoryModel?.fileListKey;

  FileTypeEnum? get fileTypeEnum => _directoryModel?.fileTypeEnum;

  final TextEditingController _searchFileController = TextEditingController();

  TextEditingController get searchFileController => _searchFileController;

  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        status: SearchFileStatus.loading,
      ),
    );

    if (fileListKey == null || fileTypeEnum == null) {
      emit(
        state.copyWith(
          status: SearchFileStatus.error,
        ),
      );
    } else {
      switch (fileTypeEnum!) {
        case FileTypeEnum.pdf:
          await _initPdfFile();
      }

    }
  }

  Future<void> _initPdfFile() async {
    await _pdfRepository.start();
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
          allFileExtendBaseModel: allPdfModel,
          searchResultList: allPdfModel?.allFiles,
          status: SearchFileStatus.initial,
        ),
      );

      print('data: ${state.allFileExtendBaseModel}');
    }
  }


  void updateSearchFileController(String? value) {
    if (value == null) return;
    _searchFileController.text = value;

    final List<FileExtendBaseModel?>? fileListResult =
    _fileListResult(value);

    emit(
      state.copyWith(
        searchResultList: fileListResult,
      ),
    );
  }

  List<FileExtendBaseModel?>? _fileListResult(
      String value,
      ) {
    final results = state.allFileExtendBaseModel!.allFiles?.where(
          (model) {
        final String? name = model?.name;
        if (name == null) {
          return false;
        } else {
          return name.toLowerCase().contains(
            _searchFileController.text.toLowerCase(),
          );
        }
      },
    ).toList();
    return results;
  }
}
