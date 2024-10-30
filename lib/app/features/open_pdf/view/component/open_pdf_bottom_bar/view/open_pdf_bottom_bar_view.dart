import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/open_pdf/view/component/open_pdf_bottom_bar/bloc/open_pdf_bottom_bar_state.dart';
import 'package:DocuSort/app/features/open_pdf/view/component/open_pdf_bottom_bar/bloc/open_pdf_buttom_bar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OpenPdfBottomBarView extends StatelessWidget {
  const OpenPdfBottomBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OpenPdfBottomBarCubit, OpenPdfBottomBarState>(
      builder: (context, state) {
        switch (state.isShow) {
          case true:
            return Expanded(
              child: Container(
                height: context.sized.heightHighValue,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  border: Border.all(
                    width: 2,
                    color: context.theme.getColor.borderColor,
                  ),
                ),
              ),
            );
          case false:
            return const SizedBox();
        }
      },
      listener: (context, state) {},
    );
  }
}
