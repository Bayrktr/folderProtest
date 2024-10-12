import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'pdf_model.freezed.dart';
part 'pdf_model.g.dart';

@freezed
@HiveType(typeId: 2)
class PdfModel with _$PdfModel {
  factory PdfModel({
    @HiveField(1) int? id,
    @HiveField(2) String? name,
    @HiveField(3) String? path,
  }) = _PdfModel;

  factory PdfModel.fromJson(Map<String, dynamic> json) =>
      _$PdfModelFromJson(json);

  PdfModel._();

  PdfModel fromJson(Map<String, dynamic> json) => PdfModel.fromJson(json);
}
