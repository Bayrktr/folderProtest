import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/null_string_extention.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/bloc/favorites_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/model/directory/favorites_directory_model.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/view/component/favorite_directory/favorite_directory_item_show_modal_sheet.dart';
import 'package:DocuSort/app/product/component/alert_dialog/show_dialog.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteDirectoryItem extends StatelessWidget {
  const FavoriteDirectoryItem({super.key, this.favoriteDirectoryModel});

  final FavoritesDirectoryModel? favoriteDirectoryModel;

  BaseDirectoryModel? get _item => favoriteDirectoryModel?.directoryModel;

  @override
  Widget build(BuildContext context) {
    if (_item == null) return const SizedBox();

    return InkWell(
      onTap: (){
        context.router.push(
          HomeDirectoryOpenRoute(
            directoryModel: _item,
          ),
        );
      },
      child: Container(
        padding: context.padding.low,
        width: context.sized.dynamicWidth(0.30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
           // fixme color: _item!.tagColor ?? context.theme.getColor.borderColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.folder_copy,
                ),
                IconButton(
                  onPressed: () {
                    IShowDialog(
                      context: context,
                      widget: FavoriteDirectoryItemShowModalSheet(
                        favoritesDirectoryModel: favoriteDirectoryModel!,
                        removeFavorite: () {
                          context
                              .read<FavoritesCubit>()
                              .deleteFavoriteDirectory(favoriteDirectoryModel!);
                        },
                        onShare: () {},
                      ),
                    ).showBottomSheet();
                  },
                  icon: const Icon(
                    Icons.more_vert,
                  ),
                )
              ],
            ),
            Text(
              _item?.name?.forNull.getGeneralNullMessage ?? '',
            )
          ],
        ),
      ),
    );
  }
}
