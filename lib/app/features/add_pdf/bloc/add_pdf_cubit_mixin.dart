import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_app/app/features/add_pdf/bloc/add_pdf_state.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/model/pdf_model.dart';

mixin AddPdfCubitMixin on Cubit<AddPdfState> {
  bool isAlreadyExist(
    List<PdfModel?>? pdfModelList,
    PdfModel pdfModel,
  ) {
    final isAlreadyExist =
        pdfModelList!.any((element) => element?.name == pdfModel.name);
    return isAlreadyExist;
  }
}
