import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomeDirectoryShowModelSheet extends StatelessWidget {
  final DirectoryModel directoryModel;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onAdd;

  const HomeDirectoryShowModelSheet({
    super.key,
    required this.directoryModel,
    required this.onDelete,
    required this.onEdit,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.file_upload),
          title: Text(
              '${directoryModel.fileTypeEnum?.name.general.capitalize ?? ''} ${LocaleKeys.general_add.lang.tr}'),
          onTap: () {
            Navigator.of(context).pop();
            context.router.push(
              getAddFileRoute,
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const LocaleText(
            text: LocaleKeys.general_edit,
          ),
          onTap: () {
            Navigator.of(context).pop();
            onEdit();
          },
        ),
        ListTile(
          leading: const Icon(Icons.delete),
          title: const LocaleText(
            text: LocaleKeys.general_delete,
          ),
          onTap: () {
            Navigator.of(context).pop();
            onDelete();
          },
        ),
      ],
    );
  }

  PageRouteInfo<dynamic> get getAddFileRoute {
    switch (directoryModel.fileTypeEnum) {
      case null:
        return const GeneralErrorRoute();
      case FileTypeEnum.pdf:
        return AddPdfRoute(
          directoryModel: directoryModel,
        );
    }
  }
}
