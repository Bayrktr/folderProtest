import 'package:DocuSort/app/product/model/file/file/file_base_model.dart';

abstract class AllFileImplementBaseModel<T> {
  /// Creates an instance of the model from a JSON map.
  T fromJson(Map<String, dynamic> json);

  /// Converts the current instance to a JSON map.
  Map<String, dynamic> toJson();
}

abstract class AllFileExtendBaseModel {
  int? id;
  List<FileExtendBaseModel?>? allFiles;
}
