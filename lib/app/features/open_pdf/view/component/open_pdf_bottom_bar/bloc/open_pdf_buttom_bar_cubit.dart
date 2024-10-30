import 'package:DocuSort/app/features/open_pdf/view/component/open_pdf_bottom_bar/bloc/open_pdf_bottom_bar_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpenPdfBottomBarCubit extends Cubit<OpenPdfBottomBarState> {
  OpenPdfBottomBarCubit() : super(OpenPdfBottomBarState());

  void changeIsShow() {
    emit(
      state.copyWith(
        isShow: !state.isShow,
      ),
    );
    print(state.isShow);
  }
}
