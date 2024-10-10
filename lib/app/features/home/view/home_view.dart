import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pdf_app/app/core/extention/build_context/build_context_extension.dart';
import 'package:pdf_app/app/product/navigation/app_router.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      routes: const [HomePdfRoute(), SettingsRoute()],
      builder: (context, child, tabController) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: context.tabsRouter.activeIndex,
            onTap: context.tabsRouter.setActiveIndex,
            unselectedItemColor: context.theme.getColor.focusColor,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.note_add_rounded,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: '',
              )
            ],
          ),
        );
      },
    );
  }
}
