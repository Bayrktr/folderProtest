

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:DocuSort/app/features/home/view/features/home_pdf/model/pdf_model.dart';


@RoutePage()
class EditPdfView extends StatelessWidget {
  const EditPdfView({super.key,this.pdfModel});

  final PdfModel? pdfModel;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
