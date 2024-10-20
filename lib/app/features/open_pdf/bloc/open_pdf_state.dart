import 'package:equatable/equatable.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/model/pdf_model.dart';
import 'package:pdf_app/app/product/model/pdf_settings/pdf_settings_model.dart';

class OpenPdfState with EquatableMixin {
  OpenPdfState({
    this.status = OpenPdfStatus.start,
    required this.pdfModel,
    this.pdfSettingsModel,
  });

  final OpenPdfStatus status;
  final PdfModel pdfModel;
  final PdfSettingsModel? pdfSettingsModel;

  @override
  List<Object?> get props => [status, pdfModel, pdfSettingsModel];

  OpenPdfState copyWith({
    OpenPdfStatus? status,
    PdfModel? pdfModel,
    PdfSettingsModel? pdfSettingsModel,
  }) =>
      OpenPdfState(
        status: status ?? this.status,
        pdfModel: pdfModel ?? this.pdfModel,
        pdfSettingsModel: pdfSettingsModel ?? this.pdfSettingsModel,
      );
}

enum OpenPdfStatus {
  start,
  initial,
  loading,
  error,
}
