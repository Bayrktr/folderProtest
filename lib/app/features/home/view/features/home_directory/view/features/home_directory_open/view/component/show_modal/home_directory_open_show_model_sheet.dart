import 'package:flutter/material.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';

class HomeDirectoryOpenShowModelSheet extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const HomeDirectoryOpenShowModelSheet({
    super.key,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.favorite_border),
          title: const LocaleText(
            text: LocaleKeys.general_addFavorite,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          leading: const Icon(Icons.share),
          title: const LocaleText(
            text: LocaleKeys.general_share,
          ),
          onTap: () {
            Navigator.of(context).pop();
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
