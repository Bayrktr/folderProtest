import 'package:DocuSort/app/product/cache/hive/operation/all_directory_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_favorites_directory_oparation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/all_pdf_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/directory_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/home_directory_open_page_layout_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/home_directory_page_layout_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/pdf_settings_operation.dart';
import 'package:DocuSort/app/product/cache/hive/operation/theme_operation.dart';
import 'package:DocuSort/app/product/service/auth/firebase/firebase_auth.dart';
import 'package:DocuSort/app/product/service/database/firebase/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

@immutable
final class GetItManager {
  const GetItManager._();

  static final getIt = GetIt.instance;

  static void setup() {
    getIt
      ..registerLazySingleton<AllDirectoryOperation>(
        AllDirectoryOperation.new,
      )
      ..registerSingleton<ThemeOperation>(
        ThemeOperation(),
      )
      ..registerSingleton<AllPdfOperation>(
        AllPdfOperation(),
      )
      ..registerSingleton<DirectoryOperation>(
        DirectoryOperation(),
      )
      ..registerSingleton<PdfSettingsOperation>(
        PdfSettingsOperation(),
      )
      ..registerSingleton<HomeDirectoryPageLayoutOperation>(
        HomeDirectoryPageLayoutOperation(),
      )
      ..registerSingleton<HomeDirectoryOpenPageLayoutOperation>(
        HomeDirectoryOpenPageLayoutOperation(),
      )
      ..registerSingleton<AllFavoritesDirectoryOperation>(
        AllFavoritesDirectoryOperation(),
      )
      ..registerSingleton<IFirebaseAuth>(
        IFirebaseAuth(
          FirebaseAuth.instance,
        ),
      )
      ..registerSingleton<FirebaseDatabase>(
        FirebaseDatabase(
          FirebaseFirestore.instance,
        ),
      );
  }
}
