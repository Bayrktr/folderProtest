import 'package:pdf_app/app/core/constant/settings.dart';
import 'package:pdf_app/app/core/extention/string/string_extention.dart';
import 'package:pdf_app/generated/locale_keys.g.dart';

final class NullCheckExtention {
  final String? _string;

  NullCheckExtention(String? value) : _string = value;

  String get getImageNotFoundAsset {
    if (_string == null) {
      return '${Settings.assetPath}image/error/image_not_found';
    } else {
      return _string;
    }
  }

  String get getGeneralNullMessage {
    if (_string == null) {
      return LocaleKeys.errors_nullErrorMessage.lang.tr;
    } else {
      return _string;
    }
  }
}
