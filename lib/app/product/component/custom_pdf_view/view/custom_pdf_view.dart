import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_app/app/product/component/custom_pdf_view/bloc/custom_pdf_view_cubit.dart';
import 'package:pdf_app/app/product/component/custom_pdf_view/bloc/custom_pdf_view_state.dart';
import 'package:pdf_app/app/product/component/custom_pdf_view/model/custom_pdf_view_model.dart';
import 'package:pdf_app/app/product/component/text/locale_text.dart';
import 'package:pdf_app/app/product/model/pdf_settings/pdf_settings_model.dart';
import 'package:pdf_app/generated/locale_keys.g.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
class CustomPdfView extends StatelessWidget {
  const CustomPdfView({
    super.key,
    required this.pdfSettingsModel,
    required this.customPdfViewModel,
  });

  final PdfSettingsModel pdfSettingsModel;
  final CustomPdfViewModel customPdfViewModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomPdfViewCubit(
        customPdfViewModel,
        pdfSettingsModel,
      )..initDatabase(),
      child: BlocConsumer<CustomPdfViewCubit, CustomPdfViewState>(
        builder: (context, state) {
          switch (state.status) {
            case CustomPdfViewStatus.loading:
              return _getCircularProgressIndicator();
            case CustomPdfViewStatus.initial:
              return SfPdfViewer.memory(
                controller:
                context.read<CustomPdfViewCubit>().pdfViewerController,
                state.customPdfViewModel.pdfModel!.byte!,
              );
            case CustomPdfViewStatus.error:
              return const LocaleText(
                text: LocaleKeys.customPdfView_errorWhileLoadingPdf,
              );
            default:
              return _getCircularProgressIndicator();
          }
        },
        listener: (context, state) {},
      ),
    );
  }

  Widget _getCircularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.redAccent,
      ),
    );
  }
}
