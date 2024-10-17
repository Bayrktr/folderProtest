import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/model/pdf_model.dart';
import 'package:pdf_app/app/product/cache/hive/model/hive_model.dart';

part 'all_pdf_model.freezed.dart';
part 'all_pdf_model.g.dart';

@freezed
@HiveType(typeId: 7)
class AllPdfModel with _$AllPdfModel, HiveModelMixin {
  factory AllPdfModel({
    @HiveField(0) int? id,
    @HiveField(1) List<PdfModel?>? allPdf,
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
