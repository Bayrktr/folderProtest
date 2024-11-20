import 'package:DocuSort/app/features/home/view/features/home_directory/model/pdf_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:DocuSort/app/features/add_pdf/bloc/add_pdf_state.dart';

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
