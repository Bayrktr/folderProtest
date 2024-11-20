import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:DocuSort/app/product/converter/uint8List_converter.dart';
import 'package:DocuSort/app/product/model/file/file/file_base_model.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'pdf_model.freezed.dart';
part 'pdf_model.g.dart';

@freezed
@HiveType(typeId: 2)
class PdfModel extends FileExtendBaseModel
    with _$PdfModel, HiveModelMixin
    implements FileImplementBaseModel {
  factory PdfModel({
    @HiveField(1) int? id,
    @HiveField(2) String? name,
    @HiveField(3) @Uint8ListConverter() Uint8List? byte,
  }) = _PdfModel;

  factory PdfModel.fromJson(Map<String, dynamic> json) =>
      _$PdfModelFromJson(json);

  PdfModel._();

  @override
  PdfModel fromJson(Map<String, dynamic> json) => PdfModel.fromJson(json);

  @override
  String get key => id.toString();
}
