import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/all_pdf_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_pdf_operation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';

abstract class IPdfRepository {
  int? get fileListKey;

  Future<void> createFirstModel();

  Future<void> deletePdfFromDirectory(AllPdfModel newPdfModel);

  AllPdfModel? getAllPdfModel();
}

class PdfRepository extends IPdfRepository {
  PdfRepository(this._fileListKey);

  final int? _fileListKey;

  final AllPdfOperation _allPdfOperation =
      GetItManager.getIt<AllPdfOperation>();

  @override
  int? get fileListKey => _fileListKey;

  @override
  Future<void> createFirstModel() async {
    await _allPdfOperation.addOrUpdateItem(
      AllPdfModel(
        id: fileListKey,
        allFiles: [],
      ),
    );
  }

  @override
  Future<void> deletePdfFromDirectory(AllPdfModel? newPdfModel) async {
    await _allPdfOperation.addOrUpdateItem(
      newPdfModel!,
    );
  }

  @override
  AllPdfModel? getAllPdfModel() {
    return _allPdfOperation.getItem(fileListKey.toString());
  }
}
