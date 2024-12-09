import 'package:DocuSort/app/core/constant/settings.dart';
import 'package:DocuSort/app/product/bloc/theme/theme_cubit.dart';
import 'package:DocuSort/app/product/bloc/theme/theme_state.dart';
import 'package:DocuSort/app/product/cache/hive/operation/theme_operation.dart';
import 'package:DocuSort/app/product/constant/app_theme.dart';
import 'package:DocuSort/app/product/init/app_init.dart';
import 'package:DocuSort/app/product/manager/getIt/getIt_manager.dart';
import 'package:DocuSort/app/product/model/theme/theme_model.dart';
import 'package:DocuSort/app/product/navigation/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  // await Hive.deleteBoxFromDisk('pdfApp');
  //return;
  await AppInit.mainInit();

  runApp(
    EasyLocalization(
      startLocale: Settings.startLocale,
      supportedLocales: Settings.supportedLocale,
      path: Settings.langPath,
      child: MyApp(),
    ),
  );

  //  runApp(TestApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  final ThemeModel _themeModel =
      GetItManager.getIt<ThemeOperation>().getItem(ThemeModel.themeModelKey) ??
          ThemeModel();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit(_themeModel),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final isLight = state.themeModel.isLight;

          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: Settings.isDebugBannerOpen,
            routerConfig: _appRouter.config(),
            title: Settings.appName,
            theme: isLight ? AppTheme.lightTheme : AppTheme.dartTheme,
          );
        },
      ),
    );
  }
}
