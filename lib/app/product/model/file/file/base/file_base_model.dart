import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';



abstract class FileImplementBaseModel<T> {
  /// Creates an instance of the model from a JSON map.
  T fromJson(Map<String, dynamic> json);

  /// Converts the current instance to a JSON map.
  Map<String, dynamic> toJson();
}

abstract class FileExtendBaseModel<T> {
  int? id;
  String? name;
  FileTypeEnum? fileTypeEnum;

  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();

}


