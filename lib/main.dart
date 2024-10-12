import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pdf_app/app/core/constant/settings.dart';
import 'package:pdf_app/app/product/bloc/theme/theme_cubit.dart';
import 'package:pdf_app/app/product/bloc/theme/theme_state.dart';
import 'package:pdf_app/app/product/init/app_init.dart';
import 'package:pdf_app/app/product/navigation/app_router.dart';

Future<void> main() async {

  AppInit.mainInit();

  runApp(
    EasyLocalization(
      startLocale: Settings.startLocale,
      supportedLocales: Settings.supportedLocale,
      path: Settings.langPath,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: Settings.isDebugBannerOpen,
            routerConfig: _appRouter.config(),
            title: Settings.appName,
            theme: state.theme,
          );
        },
      ),
    );
  }
}
