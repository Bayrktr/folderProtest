import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_app/app/core/extention/build_context/build_context_extension.dart';
import 'package:pdf_app/app/core/extention/string/null_string_extention.dart';
import 'package:pdf_app/app/features/directory_add/bloc/directory_add_cubit.dart';
import 'package:pdf_app/app/features/directory_add/bloc/directory_add_state.dart';
import 'package:pdf_app/app/features/directory_add/model/directory_model.dart';
import 'package:pdf_app/app/features/directory_add/view/directory_add_view_mixin.dart';
import 'package:pdf_app/app/product/component/alert_dialog/custom_pop_up.dart';
import 'package:pdf_app/app/product/component/alert_dialog/show_dialog.dart';
import 'package:pdf_app/app/product/navigation/app_router.dart';
import 'package:pdf_app/app/product/package/uuid/id_generator.dart';
import 'package:pdf_app/app/product/utility/validator/text_form_field_validator.dart';

@RoutePage()
class DirectoryAddView extends StatelessWidget with DirectoryAddViewMixin {
  DirectoryAddView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(
        context: context,
      ),
      body: BlocProvider(
        create: (_) => DirectoryAddCubit(),
        child: BlocConsumer<DirectoryAddCubit, DirectoryAddState>(
          builder: (context, state) {
            if (state.status == DirectoryAddStatus.start) {
              context.read<DirectoryAddCubit>().initDatabase();
            }

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.sized.widthHighValue,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: context
                          .read<DirectoryAddCubit>()
                          .directoryNameController,
                      onChanged: (String? value) {
                        context
                            .read<DirectoryAddCubit>()
                            .updateDirectoryName(value);
                      },
                      textAlign: TextAlign.center,
                      validator: (value) {
                        return TextFormFieldValidator(value: value)
                            .getEmptyCheckValidator;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton.icon(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all<Size>(
                          Size(
                            context.sized.dynamicWidth(0.3),
                            context.sized.heightMediumValue,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          context.read<DirectoryAddCubit>().updateAllDirectory(
                                DirectoryModel(
                                  id: IdGenerator.randomIntId,
                                  name: context
                                      .read<DirectoryAddCubit>()
                                      .directoryNameController
                                      .text,
                                  pdfList: [],
                                  tagColor: Colors.red,
                                ),
                              );
                        }
                      },
                      label: getButtonWidget(
                        context,
                        state.status,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state.popUpStatus == DirectoryAddPopUpStatus.show) {
              IShowDialog(
                context: context,
                widget: CustomPopup(
                  title:  context
                      .read<DirectoryAddCubit>()
                      .directoryNameController
                      .text,
                  message: state.popUpStatusMessage.forNull.getGeneralNullMessage,
                  onConfirm: () {
                    context.router.maybePop();
                  },
                ),
              ).getDialog();
            }
            if (state.status == DirectoryAddStatus.finish) {
              context.router.popAndPush(const HomeRoute());
            }
          },
        ),
      ),
    );
  }

  AppBar _getAppBar({
    required BuildContext context,
  }) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          context.router.popAndPush(const HomeRoute());
        },
        icon: const Icon(
          Icons.arrow_back,
        ),
      ),
    );
  }
}
