import 'package:auto_route/auto_route.dart';
import 'package:pdf_app/app/features/home/view/features/homePdf/view/features/homePdfOpen/view/home_pdf_open_view.dart';
import 'package:pdf_app/app/features/home/view/features/homePdf/view/home_pdf_view.dart';
import 'package:pdf_app/app/features/home/view/home_view.dart';
import 'package:pdf_app/app/features/language/view/language_view.dart';
import 'package:pdf_app/app/features/login/view/login_view.dart';
import 'package:pdf_app/app/features/settings/view/settings_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(
          page: LoginRoute.page,
          path: RoutePath.login.path,
          //initial: true,
        ),
        AdaptiveRoute(
          page: LanguageRoute.page,
          path: RoutePath.language.path,
        ),
        AdaptiveRoute(
          page: HomeRoute.page,
          path: RoutePath.home.path,
          initial: true,
          children: [
            AdaptiveRoute(
              page: HomePdfRoute.page,
              path: RoutePath.homePdf.path,
              children: [
                AdaptiveRoute(
                  page: HomePdfOpenRoute.page,
                  path: RoutePath.homePdfOpen.path,
                ),
              ],
            ),
            AdaptiveRoute(
              page: SettingsRoute.page,
              path: RoutePath.settings.path,
            ),
          ],
        ),
      ];
}

enum RoutePath {
  splash('/'),
  login('/login'),
  home('/home'),
  language('/language'),
  settings('settings'),
  homePdf('homePdf'),
  homePdfOpen('homePdfOpen');

  const RoutePath(this.path);

  final String path;

  PageRouteInfo<dynamic> get pageRouteInfo => PageRouteInfo(path);
}
