
import 'package:DocuSort/app/features/open_pdf/view/component/open_pdf_bottom_bar/bloc/open_pdf_buttom_bar_cubit.dart';
import 'package:DocuSort/app/product/component/custom_pdf_view/bloc/custom_pdf_view_cubit.dart';
import 'package:DocuSort/app/product/component/custom_pdf_view/bloc/custom_pdf_view_state.dart';
import 'package:DocuSort/app/product/component/custom_pdf_view/model/custom_pdf_view_model.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/model/pdf_settings/pdf_settings_model.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

part 'custom_pdf_view_mixin.dart';

class CustomPdfView extends StatefulWidget {
  const CustomPdfView({
    super.key,
    required this.pdfSettingsModel,
    required this.customPdfViewModel,
    required this.pdfViewerController,
  });

  final PdfSettingsModel pdfSettingsModel;
  final CustomPdfViewModel customPdfViewModel;
  final PdfViewerController pdfViewerController;

  @override
  State<CustomPdfView> createState() => _CustomPdfViewState();
}

class _CustomPdfViewState extends State<CustomPdfView> {



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomPdfViewCubit(
        widget.customPdfViewModel,
        widget.pdfSettingsModel,
        widget.pdfViewerController,
      )..initDatabase(),
      child: BlocConsumer<CustomPdfViewCubit, CustomPdfViewState>(
        builder: (context, state) {
          switch (state.status) {
            case CustomPdfViewStatus.loading:
              return _getCircularProgressIndicator();
            case CustomPdfViewStatus.initial:
              final PdfSettingsModel pdfSettingsModel = state.pdfSettingsModel;
              return SfPdfViewer.memory(
                onPageChanged: (detail) {
                  context.read<OpenPdfBottomBarCubit>().toggleBottomBarStatus();
                },
                canShowScrollHead: true,
                scrollDirection: pdfSettingsModel.swipeHorizontal
                    ? PdfScrollDirection.horizontal
                    : PdfScrollDirection.vertical,
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
