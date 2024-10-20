import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf_app/app/core/model/response_base_model.dart';
import 'package:pdf_app/app/product/manager/file_picker/allowed_extentions.dart';
import 'package:pdf_app/app/product/manager/file_picker/model/file_picker_response_model.dart';
import 'package:pdf_app/app/product/manager/permission_handler/permission_handler_manager.dart';
import 'package:pdf_app/app/product/model/error/response_error_model.dart';
import 'package:pdf_app/app/product/package/uuid/id_generator.dart';
import 'package:permission_handler/permission_handler.dart';

class FilePickerManager {
  FilePickerManager._();

  static final FilePicker _filePicker = FilePicker.platform;

  static Future<FilePickerResult?>? pickFile() async {
    if (await PermissionHandlerManager.isGranted(Permission.storage)) {
      Future<FilePickerResult?>? result = _filePicker.pickFiles(
        type: FileType.custom,
        allowedExtensions: [
          AllowedExtention.pdf,
        ],
        withData: true,
      );

      return result;
    } else {
      return null;
    }
  }

  static Future<ResponseBaseModel<FilePickerResponseModel>> savePdf(
    FilePickerResult? result,
    String directoryName,
  ) async {
    if (result == null) {
      print('Izın verilmemiş');
      return ResponseBaseModel(
        data: FilePickerResponseModel(
          message: null,
        ),
        error: ResponseErrorModel(
          message: 'İşlem Başarısız',
          statusCode: 500,
        ),
      );
    } else {
      File pdfFile = File(result.files.single.path!);
      Directory appDocumentDir = await getApplicationDocumentsDirectory();
      String appDocumentPath = appDocumentDir.path;
      File newFile = File('$appDocumentPath/${result.files.single.name}');
      await pdfFile.copy(newFile.path);

      print('pdf dosyası kaydedildi ${newFile.path}');

      print(appDocumentPath);

      return ResponseBaseModel(
        data: FilePickerResponseModel(
          id: IdGenerator.randomIntId,
          pdfPath: newFile.path,
          directoryName: directoryName,
          message: 'İşlem Başarılı',
        ),
        error: null,
      );
    }
  }
}
