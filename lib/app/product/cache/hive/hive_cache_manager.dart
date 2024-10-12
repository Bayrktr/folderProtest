import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_app/app/features/directory_add/model/directory_model.dart';
import 'package:pdf_app/app/features/home/view/features/homePdf/model/all_directory_model.dart';
import 'package:pdf_app/app/features/home/view/features/homePdf/model/pdf_model.dart';
import 'package:pdf_app/app/product/cache/hive/adapter/material_color_adapter.dart';
import 'package:pdf_app/app/product/cache/hive/operation/all_directory_operation.dart';
import 'package:pdf_app/app/product/manager/directory/directory_manager.dart';

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
    initialOperation();
  }

  @override
  Future<void> clear() async {
    await Hive.deleteFromDisk();
    await DirectoryManager.instance.removeSubDirectory(_subDirectory);
  }

  /// Open your database connection
  /// Now using [Hive]
  Future<void> _open() async {
    final subPath =
        await DirectoryManager.instance.createSubDirectory(_subDirectory);
    await Hive.initFlutter(subPath);


  }

  /// Register your generic model or make your operation before start
  void initialOperation() {
    //Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(AllDirectoryModelAdapter());
    Hive.registerAdapter(DirectoryModelAdapter());
    Hive.registerAdapter(PdfModelAdapter());
    Hive.registerAdapter(MaterialColorAdapter());
  }
}
