import 'package:equatable/equatable.dart';
import 'package:pdf_app/app/product/component/custom_pdf_view/model/custom_pdf_view_model.dart';
import 'package:pdf_app/app/product/model/pdf_settings/pdf_settings_model.dart';

class CustomPdfViewState with EquatableMixin {
  CustomPdfViewState({
    this.status = CustomPdfViewStatus.start,
    required this.customPdfViewModel,
    required this.pdfSettingsModel,
  });

  final CustomPdfViewStatus status;
  final CustomPdfViewModel customPdfViewModel;
  final PdfSettingsModel pdfSettingsModel;

  @override
  List<Object?> get props => [
        status,
        customPdfViewModel,
        pdfSettingsModel,
      ];

  CustomPdfViewState copyWith({
    CustomPdfViewStatus? status,
    CustomPdfViewModel? filePath,
    PdfSettingsModel? pdfSettingsModel,
  }) =>
      CustomPdfViewState(
        status: status ?? this.status,
        customPdfViewModel: filePath ?? customPdfViewModel,
        pdfSettingsModel: pdfSettingsModel ?? this.pdfSettingsModel,
      );
}

enum CustomPdfViewStatus {
  start,
  initial,
  loading,
  error,
}
