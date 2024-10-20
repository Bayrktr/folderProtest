import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/model/pdf_model.dart';
import 'package:pdf_app/app/features/open_pdf/bloc/open_pdf_cubit.dart';
import 'package:pdf_app/app/features/open_pdf/bloc/open_pdf_state.dart';
import 'package:pdf_app/app/product/component/custom_pdf_view/model/custom_pdf_view_model.dart';
import 'package:pdf_app/app/product/component/custom_pdf_view/view/custom_pdf_view.dart';
import 'package:pdf_app/app/product/component/text/locale_text.dart';
import 'package:pdf_app/app/product/package/uuid/id_generator.dart';
import 'package:pdf_app/generated/locale_keys.g.dart';

@RoutePage()
class OpenPdfView extends StatelessWidget {
  const OpenPdfView({
    super.key,
    required this.pdfModel,
  });

  final PdfModel pdfModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(
        context: context,
      ),
      body: BlocProvider(
        create: (_) => OpenPdfCubit(
          pdfModel,
        ),
        child: BlocConsumer<OpenPdfCubit, OpenPdfState>(
          builder: (context, state) {
            if (state.status == OpenPdfStatus.start) {
              context.read<OpenPdfCubit>().initDatabase();
            }
            switch (state.status) {
              case OpenPdfStatus.start:
                return _getCircularProgressIndicator();
              case OpenPdfStatus.initial:
                return CustomPdfView(
                  pdfSettingsModel: state.pdfSettingsModel!,
                  customPdfViewModel: CustomPdfViewModel(
                    id: IdGenerator.randomIntId,
                    pdfModel: state.pdfModel,
                  ),
                );
              case OpenPdfStatus.loading:
                return _getCircularProgressIndicator();
              case OpenPdfStatus.error:
                return const LocaleText(
                  text: LocaleKeys.customPdfView_errorWhileLoadingPdf,
                );
            }
          },
          listener: (context, state) {},
        ),
      ),
    );
  }

  AppBar _getAppBar({required BuildContext context}) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.router.maybePop();
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
      title: const LocaleText(text: LocaleKeys.openPdf_viewPdf),
    );
  }

  Widget _getCircularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
