import 'package:flutter/material.dart';
import 'package:pdf_app/app/features/directory_add/model/directory_model.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/model/pdf_model.dart';
import 'package:pdf_app/app/product/component/text/locale_text.dart';
import 'package:pdf_app/generated/locale_keys.g.dart';

class HomeDirectoryOpenShowModelSheet extends StatelessWidget {
  final PdfModel pdfModel;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const HomeDirectoryOpenShowModelSheet({
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
