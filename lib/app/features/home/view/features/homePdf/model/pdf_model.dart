import 'package:freezed_annotation/freezed_annotation.dart';

part 'pdf_model.freezed.dart';
part 'pdf_model.g.dart';

@freezed
class PdfModel with _$PdfModel {
  factory PdfModel({
    int? id,
    String? title,
    String? url,
  }) = _PdfModel;

  factory PdfModel.fromJson(Map<String, dynamic> json) =>
      _$PdfModelFromJson(json);

  PdfModel._();

  PdfModel fromJson(Map<String, dynamic> json) => PdfModel.fromJson(json);
}
