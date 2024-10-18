import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_app/app/core/extention/build_context/build_context_extension.dart';
import 'package:pdf_app/app/core/extention/string/null_string_extention.dart';
import 'package:pdf_app/app/core/extention/string/string_extention.dart';
import 'package:pdf_app/app/features/directory_add/model/directory_model.dart';
import 'package:pdf_app/app/features/edit_directory/bloc/edit_directory_cubit.dart';
import 'package:pdf_app/app/features/edit_directory/bloc/edit_directory_state.dart';
import 'package:pdf_app/app/features/edit_directory/view/component/edit_directory_show_model_sheet.dart';
import 'package:pdf_app/app/features/edit_directory/view/component/edit_directory_snack_bar.dart';
import 'package:pdf_app/app/product/component/alert_dialog/show_dialog.dart';
import 'package:pdf_app/app/product/component/text/locale_text.dart';
import 'package:pdf_app/app/product/navigation/app_router.dart';
import 'package:pdf_app/app/product/utility/validator/text_form_field_validator.dart';
import 'package:pdf_app/generated/locale_keys.g.dart';

part 'edit_directory_mixin.dart';

@RoutePage()
class EditDirectoryView extends StatelessWidget with _EditDirectoryMixin {
  EditDirectoryView({super.key, this.directoryModel});

  final DirectoryModel? directoryModel;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (directoryModel == null) {
      return Container();
    }

    return Scaffold(
      appBar: _getAppbar(context: context),
      body: BlocProvider(
        create: (_) => EditDirectoryCubit(directoryModel),
        child: BlocConsumer<EditDirectoryCubit, EditDirectoryState>(
          builder: (context, state) {
            if (state.status == EditDirectoryStatus.start) {
              context.read<EditDirectoryCubit>().initDatabase();
            }

            return Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.sized.widthNormalValue,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: context
                          .read<EditDirectoryCubit>()
                          .directoryNameController,
                      onChanged: (String? value) {
                        context
                            .read<EditDirectoryCubit>()
                            .editDirectoryName(value);
                      },
                      textAlign: TextAlign.center,
                      validator: (value) {
                        return TextFormFieldValidator(value: value)
                            .getEmptyCheckValidator;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    getAllPdfListViewBuilder(
                      state: state,
                      context: context,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    getAddPdfButton(
                        context: context, directoryModel: directoryModel!),
                    const SizedBox(
                      height: 20,
                    ),
                    getSaveButton(
                        status: state.status,
                        context: context,
                        onPressed: () {
                          if ((_formKey.currentState?.validate() ?? false) &&
                              state.status == EditDirectoryStatus.initial) {
                            context
                                .read<EditDirectoryCubit>()
                                .updateDirectory();
                          }
                        }),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {
            switch (state.allPdfSnackBarStatus) {
              case EditDirectoryAllPdfSnackBarStatus.initial:
                return;
              case EditDirectoryAllPdfSnackBarStatus.success:
                EditDirectorySnackBar(
                  message:
                      LocaleKeys.editDirectory_pdfDeletedSuccessfully.lang.tr,
                ).show(
                  context,
                );
              case EditDirectoryAllPdfSnackBarStatus.error:
                return;
            }
          },
        ),
      ),
    );
  }

  AppBar _getAppbar({required BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: const LocaleText(text: LocaleKeys.editDirectory_editDirectory),
      leading: IconButton(
        onPressed: () {
          context.router.maybePop();
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }
}
