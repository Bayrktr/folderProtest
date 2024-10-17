import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_app/app/core/extention/build_context/build_context_extension.dart';
import 'package:pdf_app/app/core/extention/string/null_string_extention.dart';
import 'package:pdf_app/app/core/extention/string/string_extention.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/bloc/home_pdf_cubit.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/bloc/home_pdf_state.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/view/component/home_pdf_show_model_sheet.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/view/component/home_pdf_snack_bar.dart';
import 'package:pdf_app/app/product/component/alert_dialog/show_dialog.dart';
import 'package:pdf_app/app/product/component/text/locale_text.dart';
import 'package:pdf_app/app/product/navigation/app_router.dart';
import 'package:pdf_app/generated/locale_keys.g.dart';

@RoutePage()
class HomePdfView extends StatelessWidget {
  const HomePdfView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(
        context: context,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(DirectoryAddRoute());
        },
        heroTag: 'pdf_add',
        child: const Icon(Icons.add),
      ),
      body: BlocProvider<HomePdfCubit>(
        create: (_) => HomePdfCubit(),
        child: BlocConsumer<HomePdfCubit, HomePdfState>(
          builder: (context, state) {
            if (state.status == HomePdfStatus.start) {
              context.read<HomePdfCubit>().initDatabase();
            }

            switch (state.status) {
              case HomePdfStatus.initial:
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.sized.widthNormalValue,
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      final item = state.allDirectory?.allDirectory?[index];

                      return item == null
                          ? const SizedBox()
                          : Padding(
                              padding: context.padding.veryLow,
                              child: ListTile(
                                onTap: () {
                                  context.router.push(
                                    HomeDirectoryOpenRoute(
                                      directoryModel: item,
                                    ),
                                  );
                                },
                                shape: Border.all(
                                  color: context.theme.getColor.borderColor,
                                ),
                                leading: Text(
                                  item.name.forNull.getGeneralNullMessage,
                                ),
                                trailing: IconButton(
                                  onPressed: () {
                                    IShowDialog(
                                      context: context,
                                      widget: HomePdfShowModelSheet(
                                        directoryModel: item,
                                        onAdd: () {
                                          context.router.push(
                                            AddPdfRoute(
                                              directoryModel: item,
                                            ),
                                          );
                                        },
                                        onDelete: () {
                                          context
                                              .read<HomePdfCubit>()
                                              .deleteDirectoryFromAllDirectory(
                                                item,
                                              );
                                        },
                                        onEdit: () {},
                                      ),
                                    ).showBottomSheet();
                                  },
                                  icon: const Icon(
                                    Icons.more_vert,
                                  ),
                                ),
                              ),
                            );
                    },
                    itemCount: state.allDirectory?.allDirectory?.length ?? 0,
                  ),
                );
              case HomePdfStatus.error:
                return const Center(
                  child: LocaleText(
                    text: LocaleKeys.errors_nullErrorMessage,
                  ),
                );
              case HomePdfStatus.loading:
                return const Center(child: CircularProgressIndicator());

              case HomePdfStatus.start:
                return const Center(child: CircularProgressIndicator());
            }
          },
          listener: (context, state) {
            if (state.snackBarStatus == HomePdfSnackBarStatus.deletedSuccess) {
              HomePdfSnackBar(
                message: LocaleKeys.home_directoryDeletedSuccessfully.lang.tr,
                duration: const Duration(
                  seconds: 1,
                ),
              ).show(context);
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
      automaticallyImplyLeading: false,
      title: const LocaleText(
        text: LocaleKeys.home_selectDirectory,
      ),
    );
  }
}
