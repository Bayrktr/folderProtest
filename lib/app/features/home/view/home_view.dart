import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/features/home/view/component/home_bottom_sheet_item.dart';
import 'package:DocuSort/app/features/home/view/features/favorites/bloc/favorites_cubit.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FavoritesCubit()..initDatabase(),
        ),
      ],
      child: AutoTabsRouter.tabBar(
        routes: const [
          HomeDirectoryRoute(),
          FavoritesRoute(),
          SettingsHomeRoute(),
        ],
        builder: (context, child, tabController) {
          return Scaffold(
            body: child,
            bottomNavigationBar: _getBottomBar(
              context: context,
            ),
          );
        },
      ),
    );
  }

  Widget _getBottomBar({
    required BuildContext context,
  }) {
    final selectedIndex = context.tabsRouter.activeIndex;

    return Container(
      decoration: BoxDecoration(
        color: context.theme.getColor.focusColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      width: context.sized.width,
      height: context.sized.dynamicHeight(0.1),
      child: Row(
        children: [
          HomeBottomSheetItem(
            selectedIndex: selectedIndex,
            itemIndex: 0,
            iconData: Icons.note_add,
          ),
          HomeBottomSheetItem(
            selectedIndex: selectedIndex,
            itemIndex: 1,
            iconData: Icons.favorite_border,
          ),
          HomeBottomSheetItem(
            selectedIndex: selectedIndex,
            itemIndex: 2,
            iconData: Icons.settings,
          ),
        ],
      ),
    );
  }
}
