import 'package:flutter/cupertino.dart';

@immutable
final class Settings {
  const Settings._();

  static String appName = 'Pdf App';

  static bool isDebugBannerOpen = false;

  static const List<Locale> supportedLocale = [
    Settings.trLocale,
  ];

  static const String tr = 'tr';

  static const Locale trLocale = Locale('tr', 'TR');

  static const Locale startLocale = Settings.trLocale;

  static const String assetPath = 'asset/';

  static const String langPath = '${Settings.assetPath}lang';
}
