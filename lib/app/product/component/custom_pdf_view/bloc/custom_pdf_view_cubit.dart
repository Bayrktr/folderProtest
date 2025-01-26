import 'package:DocuSort/app/product/component/custom_pdf_view/bloc/custom_pdf_view_state.dart';
import 'package:DocuSort/app/product/component/custom_pdf_view/model/custom_pdf_view_model.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:DocuSort/app/product/model/pdf_settings/pdf_settings_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CustomPdfViewCubit extends Cubit<CustomPdfViewState> {
  CustomPdfViewCubit(
    this.customPdfViewModel,
    this.pdfSettingsModel,
    this.pdfViewerController,
  ) : super(
          CustomPdfViewState(
            customPdfViewModel: customPdfViewModel,
            pdfSettingsModel: pdfSettingsModel,
          ),
        );

  final CustomPdfViewModel customPdfViewModel;
  final PdfSettingsModel pdfSettingsModel;
  final PdfViewerController pdfViewerController;

  PdfModel? get getPdfModel => customPdfViewModel.pdfModel;

  PdfViewerController get pdfController => pdfViewerController;

  Future<void> initDatabase() async {
    emit(
      state.copyWith(
        status: CustomPdfViewStatus.loading,
      ),
    );

    if (getPdfModel?.byte == null) {
      emit(
        state.copyWith(
          status: CustomPdfViewStatus.error,
        ),
      );
      return;
    }

    // fixme

    emit(
      state.copyWith(
        status: CustomPdfViewStatus.initial,
      ),
    );
  }
}
