import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/model/pdf_model.dart';
import 'package:pdf_app/app/product/component/custom_pdf_view/bloc/custom_pdf_view_state.dart';
import 'package:pdf_app/app/product/component/custom_pdf_view/model/custom_pdf_view_model.dart';
import 'package:pdf_app/app/product/model/pdf_settings/pdf_settings_model.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CustomPdfViewCubit extends Cubit<CustomPdfViewState> {
  CustomPdfViewCubit(
    this.customPdfViewModel,
    this.pdfSettingsModel,
  ) : super(
          CustomPdfViewState(
            customPdfViewModel: customPdfViewModel,
            pdfSettingsModel: pdfSettingsModel,
          ),
        );

  final CustomPdfViewModel customPdfViewModel;
  final PdfSettingsModel pdfSettingsModel;

  PdfModel? get getPdfModel => customPdfViewModel.pdfModel;

  final PdfViewerController _pdfViewerController = PdfViewerController();

  PdfViewerController get pdfViewerController => _pdfViewerController;

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

    print('saa');
    emit(
      state.copyWith(
        status: CustomPdfViewStatus.initial,
      ),
    );
  }
}
