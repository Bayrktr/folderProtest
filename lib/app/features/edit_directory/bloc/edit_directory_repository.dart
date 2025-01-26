import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_directory_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/directory_operation.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/repository/file/pdf_repository.dart';

abstract class IEditDirectoryRepository {
  int? get fileListKey;

  DirectoryModel? get selectedDirectoryModel;

  PdfRepository get pdfRepository;

  Future<void> initDatabase();
}

class EditDirectoryRepository extends IEditDirectoryRepository {
  EditDirectoryRepository(this._selectedDirectoryModel, this._pdfRepository);

  final PdfRepository _pdfRepository;

  final AllDirectoryOperation _allDirectoryOperation =
      GetItManager.getIt<AllDirectoryOperation>();

  final DirectoryOperation _directoryOperation =
      GetItManager.getIt<DirectoryOperation>();

  final DirectoryModel? _selectedDirectoryModel;

  @override
  int? get fileListKey => _selectedDirectoryModel?.fileListKey;

  @override
  DirectoryModel? get selectedDirectoryModel => _selectedDirectoryModel;

  @override
  PdfRepository get pdfRepository => _pdfRepository;

  FileTypeEnum? get _selectedDirectoryModelType =>
      _selectedDirectoryModel?.fileTypeEnum;

  @override
  Future<void> initDatabase() async {
    if (fileListKey == null || _selectedDirectoryModelType == null) return;

    switch (_selectedDirectoryModelType!) {
      case FileTypeEnum.pdf:
        await _pdfRepository.start();
    }
    await _directoryOperation.start(fileListKey!.toString());
    await _allDirectoryOperation.start(
      AllDirectoryModel.allDirectoryKey,
    );
  }
}
