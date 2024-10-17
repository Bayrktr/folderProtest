import 'package:flutter/material.dart';
import 'package:pdf_app/app/features/add_pdf/bloc/add_pdf_state.dart';
import 'package:pdf_app/app/product/component/text/locale_text.dart';
import 'package:pdf_app/generated/locale_keys.g.dart';

mixin AddPdfMixin on StatelessWidget {
  Widget saveButtonWidget(AddPdfStatus status) {
    switch (status) {
      case AddPdfStatus.start:
        return const CircularProgressIndicator();
      case AddPdfStatus.initial:
        return const LocaleText(
          text: LocaleKeys.general_save,
        );
      case AddPdfStatus.loading:
        return const CircularProgressIndicator();
      case AddPdfStatus.error:
        return const LocaleText(text: LocaleKeys.errors_nullErrorMessage);
      case AddPdfStatus.finish:
        return const CircularProgressIndicator();
    }
  }
}
