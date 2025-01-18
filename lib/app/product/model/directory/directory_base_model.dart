import 'package:DocuSort/app/product/enum/file_type_enum.dart';

abstract class BaseDirectoryModel {
  factory BaseDirectoryModel.fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }

  int? get id;

  String? get name;

  int? get fileListKey;

  FileTypeEnum? get fileTypeEnum;

  Map<String, dynamic> toJson();

  BaseDirectoryModel copyWith({
    int? id,
    String? name,
    int? fileListKey,
    FileTypeEnum? fileTypeEnum,
  });
}
