import 'package:DocuSort/app/features/add_pdf/view/add_pdf_view.dart';
import 'package:DocuSort/app/features/directory_add/model/directory_model.dart';
import 'package:DocuSort/app/features/directory_add/view/directory_add_view.dart';
import 'package:DocuSort/app/features/edit_directory/view/edit_directory_view.dart';
import 'package:DocuSort/app/features/edit_pdf/view/edit_pdf_view.dart';
import 'package:DocuSort/app/features/error/features/general_error/view/general_error_view.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/model/pdf_model.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/features/home_directory_open/view/home_directory_open_view.dart';
import 'package:DocuSort/app/features/home/view/features/home_directory/view/home_directory_view.dart';
import 'package:DocuSort/app/features/home/view/features/settings_home/view/features/language/view/language_view.dart';
import 'package:DocuSort/app/features/home/view/features/settings_home/view/features/settings/view/settings_view.dart';
import 'package:DocuSort/app/features/home/view/features/settings_home/view/settings_home_view.dart';
import 'package:DocuSort/app/features/home/view/home_view.dart';
import 'package:DocuSort/app/features/login/view/login_view.dart';
import 'package:DocuSort/app/features/open_pdf/view/open_pdf_view.dart';
import 'package:DocuSort/app/features/pdf_view_settings/view/pdf_settings_view.dart';
import 'package:DocuSort/app/features/splash/view/splash_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AdaptiveRoute(
          page: SplashRoute.page,
          path: RoutePath.splash.path,
          initial: true,
        ),
        AdaptiveRoute(
          page: LoginRoute.page,
          path: RoutePath.login.path,
          //initial: true,
        ),
        AdaptiveRoute(
          page: DirectoryAddRoute.page,
          path: RoutePath.directoryAdd.path,
        ),
        AdaptiveRoute(
          page: HomeDirectoryOpenRoute.page,
          path: RoutePath.homeDirectoryOpen.path,
        ),
        AdaptiveRoute(
          page: AddPdfRoute.page,
          path: RoutePath.pdfAdd.path,
        ),
        AdaptiveRoute(
          page: EditDirectoryRoute.page,
          path: RoutePath.directoryEdit.path,
        ),
        AdaptiveRoute(
          page: EditPdfRoute.page,
          path: RoutePath.pdfEdit.path,
        ),
        AdaptiveRoute(
          page: OpenPdfRoute.page,
          path: RoutePath.openPdf.path,
        ),
        AdaptiveRoute(
          page: PdfSettingsRoute.page,
          path: RoutePath.pdfSettings.path,
        ),
        AdaptiveRoute(
          page: GeneralErrorRoute.page,
          path: RoutePath.generalError.path,
        ),
        AdaptiveRoute(
          page: HomeRoute.page,
          path: RoutePath.home.path,
          // initial: true,
          children: [
            AdaptiveRoute(
              page: HomeDirectoryRoute.page,
              path: RoutePath.homePdf.path,
            ),
            AdaptiveRoute(
              page: SettingsHomeRoute.page,
              path: RoutePath.settingsHome.path,
              children: [
                AdaptiveRoute(
                  page: LanguageRoute.page,
                  path: RoutePath.language.path,
                ),
                AdaptiveRoute(
                  page: SettingsRoute.page,
                  path: RoutePath.settings.path,
                  initial: true,
                ),
              ],
            ),
          ],
        ),
      ];
}

enum RoutePath {
  splash('/'),
  login('/login'),
  home('/home'),
  language('language'),
  directoryAdd('/directoryAdd'),
  settings('settings'),
  homePdf('homeDirectory'),
  directoryEdit('/directoryEdit'),
  pdfEdit('/pdfEdit'),
  pdfAdd('/pdfAdd'),
  settingsHome('settingsHome'),
  openPdf('/openPdf'),
  pdfSettings('/pdfSettings'),
  generalError('/generalError'),
  homeDirectoryOpen('/homeDirectoryOpen');

  const RoutePath(this.path);

  final String path;

  String get getPath => path;

  PageRouteInfo<dynamic> get pageRouteInfo => PageRouteInfo(path);
}
