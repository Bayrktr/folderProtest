import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/all_favorites_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/favorites_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/all_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/model/pdf/all_pdf_model.dart';
import 'package:DocuSort/app/product/cache/hive/adapter/file_type_enum_adapter.dart';
import 'package:DocuSort/app/product/cache/hive/adapter/material_color_adapter.dart';
import 'package:DocuSort/app/product/cache/hive/adapter/page_layout_enum_adapter.dart';
import 'package:DocuSort/app/product/cache/hive/adapter/theme_data_adapter.dart';
import 'package:DocuSort/app/product/component/custom_pdf_view/model/custom_pdf_view_model.dart';
import 'package:DocuSort/app/product/manager/directory/directory_manager.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:DocuSort/app/product/model/page_layout/home_directory_open_layout_model/home_directory_open_page_layout_model.dart';
import 'package:DocuSort/app/product/model/page_layout/home_directory_page_layout/home_directory_page_layout_model.dart';
import 'package:DocuSort/app/product/model/pdf_settings/pdf_settings_model.dart';
import 'package:DocuSort/app/product/model/theme/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';

abstract class IDatabaseManager {
  Future<void> start();

  Future<void> clear();
}

@immutable
final class HiveCacheManager implements IDatabaseManager {
  final String _subDirectory = 'pdfApp';

  @override
  Future<void> start() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);

    await _open();
    _initialOperation();
  }

  @override
  Future<void> clear() async {
    await Hive.close();

    await Hive.deleteFromDisk();
    await DirectoryManager.instance.removeSubDirectory(_subDirectory);
  }

  Future<void> _open() async {
    final subPath =
        await DirectoryManager.instance.createSubDirectory(_subDirectory);
    await Hive.initFlutter(subPath);
  }

  void _initialOperation() {
    //Hive.registerAdapter(UserAdapter());
    Hive
      ..registerAdapter(AllDirectoryModelAdapter())
      ..registerAdapter(DirectoryModelAdapter())
      ..registerAdapter(AllPdfModelAdapter())
      ..registerAdapter(PdfModelAdapter())
      ..registerAdapter(MaterialColorAdapter())
      ..registerAdapter(ThemeModelAdapter())
      ..registerAdapter(ThemeDataAdapter())
      ..registerAdapter(PdfSettingsModelAdapter())
      ..registerAdapter(CustomPdfViewModelAdapter())
      ..registerAdapter(FileTypeEnumAdapter())
      ..registerAdapter(HomeDirectoryPageLayoutModelAdapter())
      ..registerAdapter(PageLayoutEnumAdapter())
      ..registerAdapter(HomeDirectoryOpenPageLayoutModelAdapter())
      ..registerAdapter(ColorAdapter())
      ..registerAdapter(AllFavoritesDirectoryModelAdapter())
      ..registerAdapter(FavoritesDirectoryModelAdapter());
  }
}
