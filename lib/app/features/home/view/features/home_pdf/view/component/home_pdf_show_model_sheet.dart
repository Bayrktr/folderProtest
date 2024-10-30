import 'package:flutter/material.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';

class HomePdfShowModelSheet extends StatelessWidget {
  final DirectoryModel directoryModel;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onAdd;

  const HomePdfShowModelSheet({
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
          title: const LocaleText(
            text: LocaleKeys.directoryOpen_addPdfd,
          ),
          onTap: () {
            Navigator.of(context).pop();
            onAdd();
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
}
