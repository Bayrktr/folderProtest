import 'package:DocuSort/app/features/home/view/features/home_directory/model/pdf_model.dart';
import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:DocuSort/app/product/model/file/all_file/all_file_base_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'all_pdf_model.freezed.dart';
part 'all_pdf_model.g.dart';

@freezed
@HiveType(typeId: 7)
class AllPdfModel extends AllFileExtendBaseModel
    with _$AllPdfModel, HiveModelMixin
    implements AllFileImplementBaseModel<AllPdfModel> {
  factory AllPdfModel({
    @HiveField(0) int? id,
    @HiveField(1) List<PdfModel?>? allFiles,
  }) = _AllPdfModel;

  factory AllPdfModel.fromJson(Map<String, dynamic> json) =>
      _$AllPdfModelFromJson(json);

  AllPdfModel._();

  AllPdfModel fromJson(Map<String, dynamic> json) => AllPdfModel.fromJson(json);

  @override
  String get key {
    return id.toString();
  }
}
