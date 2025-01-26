import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/favorites_directory_model.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class FavoriteDirectoryItemShowModalSheet extends StatelessWidget {
  const FavoriteDirectoryItemShowModalSheet({
    super.key,
    required this.favoritesDirectoryModel,
    required this.removeFavorite,
    required this.onShare
  });

  final FavoritesDirectoryModel favoritesDirectoryModel;
  final VoidCallback removeFavorite;
  final VoidCallback onShare;


  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
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
          leading: const Icon(Icons.remove_circle_outline_sharp),
          title: const LocaleText(
            text: LocaleKeys.favorites_removeFromFavorites,
          ),
          onTap: () {
            Navigator.of(context).pop();
            removeFavorite();
          },
        ),
      ],
    );
  }

}
