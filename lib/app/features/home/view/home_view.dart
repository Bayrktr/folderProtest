import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:DocuSort/app/core/extention/build_context/build_context_extension.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [HomeDirectoryRoute(), SettingsHomeRoute()],
      builder: (context, child, tabController) {
        return Scaffold(
          body: child,
          bottomNavigationBar: _getBottomBar(
            context: context,
          ),
        );
      },
    );
  }

  Widget _getBottomBar({
    required BuildContext context,
  }) {
    final int selectedIndex = context.tabsRouter.activeIndex;

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
          Expanded(
            child: InkWell(
              onTap: () {
                context.tabsRouter.setActiveIndex(0);
              },
              child: Container(
                height: double.infinity,
                color: Colors.transparent,
                child: Icon(
                  Icons.note_add,
                  color: selectedIndex == 0
                      ? null
                      : context.theme.getColor.focusColor,
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                context.tabsRouter.setActiveIndex(1);
              },
              child: Container(
                height: double.infinity,

                color: Colors.transparent,
                child: Icon(
                  Icons.settings,
                  color: selectedIndex == 1
                      ? null
                      : context.theme.getColor.focusColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
