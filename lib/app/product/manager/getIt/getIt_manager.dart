import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pdf_app/app/product/cache/hive/operation/all_directory_operation.dart';

@immutable
final class GetItManager {
  const GetItManager._();

  static final getIt = GetIt.instance;

  static void setup() {
    getIt.registerLazySingleton<AllDirectoryOperation>(
      () => AllDirectoryOperation(),
    );
  }
}
