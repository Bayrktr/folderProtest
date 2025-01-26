import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/product/model/file/file/pdf/pdf_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/view/component/icons/home_directory_open_more_vertical_icon.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/file/all_file/all_file_base_model.dart';
import 'package:DocuSort/app/product/model/file/file/base/file_base_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomeDirectoryOpenListLayout extends StatelessWidget {
  const HomeDirectoryOpenListLayout({
    super.key,
    required this.allFileExtendBaseModel,
    required this.directoryModel,
  });

  final AllFileExtendBaseModel? allFileExtendBaseModel;
  final DirectoryModel? directoryModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = allFileExtendBaseModel?.allFiles?[index];
        if (item == null) return const SizedBox();

        return ListTile(
          onTap: () {
            context.router.push(
              getNavigatePageRoute(
                directoryModel!.fileTypeEnum,
                fileBaseModel: item,
              ),
            );
          },
          leading: Icon(
            directoryModel?.fileTypeEnum?.getIconData
          ),
          title: Text(
            item.name.forNull.getGeneralNullMessage,
            style: context.theme.getTextStyle.bodyText1,
          ),
          trailing: HomeDirectoryOpenMoreVerticalIcon(
            directoryModel: directoryModel,
            item: item,
          ),
        );
      },
      itemCount: allFileExtendBaseModel?.allFiles?.length ?? 0,
    );
  }

  PageRouteInfo<dynamic> getNavigatePageRoute(
    FileTypeEnum? fileTypeEnum, {
    FileExtendBaseModel? fileBaseModel,
  }) {
    switch (fileTypeEnum) {
      case null:
        return const GeneralErrorRoute();
      case FileTypeEnum.pdf:
        if (fileBaseModel is! PdfModel) return const GeneralErrorRoute();
        return OpenPdfRoute(
          pdfModel: fileBaseModel,
        );
    }
  }
}
