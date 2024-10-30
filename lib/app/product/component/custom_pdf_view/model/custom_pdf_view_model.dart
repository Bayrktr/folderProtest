import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:DocuSort/app/features/home/view/features/home_pdf/model/pdf_model.dart';
import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';

part 'custom_pdf_view_model.freezed.dart';
part 'custom_pdf_view_model.g.dart';

@freezed
@HiveType(typeId: 9)
class CustomPdfViewModel with _$CustomPdfViewModel, HiveModelMixin {
  factory CustomPdfViewModel({
    @HiveField(0) int? id,
    @HiveField(1) PdfModel? pdfModel,
  }) = _CustomPdfViewModel;

  factory CustomPdfViewModel.fromJson(Map<String, dynamic> json) =>
      _$CustomPdfViewModelFromJson(json);

  CustomPdfViewModel._();

  CustomPdfViewModel fromJson(Map<String, dynamic> json) =>
      CustomPdfViewModel.fromJson(json);

  static const String customPdfViewModelKey = 'customPdfViewModel';

  @override
  String get key {
    return customPdfViewModelKey;
  }
}
