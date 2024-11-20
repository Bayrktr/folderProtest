

import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/pdf_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/cubit/home_directory_open_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/view/component/show_modal/home_directory_open_show_model_sheet.dart';
import 'package:DocuSort/app/product/component/alert_dialog/show_dialog.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/file/file/file_base_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeDirectoryOpenMoreVerticalIcon extends StatelessWidget {
  const HomeDirectoryOpenMoreVerticalIcon({super.key, required this.directoryModel, required  this.item,});

  final DirectoryModel? directoryModel;
  final FileExtendBaseModel item;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        IShowDialog(
          context: context,
          widget: HomeDirectoryOpenShowModelSheet(
            onEdit: () {
              context.router.push(
                getNavigateEditPageRoute(
                  directoryModel!.fileTypeEnum,
                ),
              );
            },
            onDelete: () {
              context
                  .read<HomeDirectoryOpenCubit>()
                  .deleteFileList(
                item,
              );
            },
          ),
        ).showBottomSheet();
      },
      icon: const Icon(
        Icons.more_vert,
      ),
    );
  }

  PageRouteInfo<dynamic> getNavigateEditPageRoute(
      FileTypeEnum? fileTypeEnum, {
        PdfModel? pdfModel,
      }) {
    switch (fileTypeEnum) {
      case null:
        return const GeneralErrorRoute();
      case FileTypeEnum.pdf:
        return EditPdfRoute(
          pdfModel: pdfModel,
        );
    }
  }
}
