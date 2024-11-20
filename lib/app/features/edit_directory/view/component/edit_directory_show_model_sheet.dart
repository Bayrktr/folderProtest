import 'package:DocuSort/app/features/home/view/features/home_directory/model/pdf_model.dart';
import 'package:flutter/material.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';

class EditDirectoryShowModelSheet extends StatelessWidget {
  final PdfModel pdfModel;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const EditDirectoryShowModelSheet({
    super.key,
    required this.pdfModel,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
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
