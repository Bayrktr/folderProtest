import 'package:pdf_app/app/core/extention/string/string_extention.dart';
import 'package:pdf_app/generated/locale_keys.g.dart';

class TextFormFieldValidator {
  TextFormFieldValidator({this.value});

  final String? value;

  String? get getEmptyCheckValidator {
    if (value == null) {
      return null;
    } else {
      if (value == null || value!.trim().isEmpty) {
        return LocaleKeys.validate_directoryNameCannotEmpty.lang.tr;
      } else {
        return null;
      }
    }
  }
}
