import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:pdf_app/app/product/cache/hive/hive_cache_manager.dart';
import 'package:pdf_app/app/product/manager/getIt/getIt_manager.dart';

final class AppInit {
  const AppInit._();

  static Future<void> mainInit() async {
    WidgetsFlutterBinding.ensureInitialized();

    await EasyLocalization.ensureInitialized();

    GetItManager.setup();

    await HiveCacheManager().start();
  }
}
