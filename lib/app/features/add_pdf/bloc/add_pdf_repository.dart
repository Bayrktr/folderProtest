import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/pdf/all_pdf_model.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_pdf_operation.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';

abstract class IAddPdfRepository {
  int? get fileListKey;

  Future<void> start();

  Future<void> createFirstModel();

  Future<void> updateAllPdfModel(AllPdfModel newPdfModel);

  AllPdfModel? get getAllPdfModel;
}

class AddPdfRepository extends IAddPdfRepository {
  AddPdfRepository(this._fileListKey);

  final int? _fileListKey;

  @override
  int? get fileListKey => _fileListKey;

  final AllPdfOperation _allPdfOperation =
      GetItManager.getIt<AllPdfOperation>();

  @override
  Future<void> start() async {
    await _allPdfOperation.start(_fileListKey.toString());
  }

  @override
  Future<void> createFirstModel() async {
    await _allPdfOperation.addOrUpdateItem(
      AllPdfModel(
        id: int.parse(fileListKey.toString()),
        allFiles: [],
      ),
    );
  }

  @override
  AllPdfModel? get getAllPdfModel {
    return _allPdfOperation.getItem(fileListKey.toString());
  }

  @override
  Future<void> updateAllPdfModel(AllPdfModel newPdfModel) async {
    await _allPdfOperation.addOrUpdateItem(newPdfModel);
  }
}
