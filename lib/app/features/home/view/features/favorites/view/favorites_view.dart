import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/core/extention/string/string_extention.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/bloc/favorites_cubit.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/bloc/favorites_state.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/view/component/favorite_directory/favorite_directory_item.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/view/component/snack_bar/favorite_snack_bar.dart';
import 'package:DocuSort/app/product/component/text/locale_text.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:DocuSort/generated/locale_keys.g.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: LocaleText(
                text: LocaleKeys.favorites_favorites,
                textStyle: context.theme.getTextStyle.headline1,
              ),
            ),
            body: switch (state.status) {
              FavoritesStatus.start =>
                _getCircularProgressIndicator(context: context),
              FavoritesStatus.initial => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: context.padding.normal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LocaleText(
                            text: LocaleKeys.home_directorys,
                            textStyle: context.theme.getTextStyle.headline1,
                          ),
                          IconButton(
                            onPressed: () {
                              context.router.push(
                                const SearchFavoriteDirectoryRoute(),
                              );
                            },
                            icon: const Icon(
                              Icons.search,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.allFavoritesDirectoryModel
                                ?.allFavoritesDirectory.length ??
                            0,
                        itemBuilder: (BuildContext context, int index) {
                          final item = state.allFavoritesDirectoryModel
                              ?.allFavoritesDirectory[index];

                          return Padding(
                            padding: context.padding.low,
                            child: FavoriteDirectoryItem(
                              favoriteDirectoryModel: item,
                            ),
                          );
                        },
                      ),
                    ),
                    _getBodySpace,
                    const Expanded(
                      flex: 2,
                      child: SizedBox(),
                    ),
                    _getBodySpace,
                  ],
                ),
              FavoritesStatus.loading =>
                _getCircularProgressIndicator(context: context),
              FavoritesStatus.error =>
                _getCircularProgressIndicator(context: context),
            });
      },
      listener: (context, state) {
        switch (state.snackBarStatus) {
          case FavoriteSnackBarStatus.initial:
            break;
          case FavoriteSnackBarStatus.deletedSuccess:
            FavoriteSnackBar(
              message: LocaleKeys.favorites_removedFromFavorites.lang.tr,
            ).show(context);
        }
      },
    );
  }

  Widget _getCircularProgressIndicator({required BuildContext context}) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget get _getBodySpace {
    return const Expanded(
      flex: 2,
      child: SizedBox(),
    );
  }
}
