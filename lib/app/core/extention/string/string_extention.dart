import 'package:pdf_app/app/core/extention/string/general_string_extention.dart';
import 'package:pdf_app/app/core/extention/string/lang_extention.dart';

extension StringExtention on String {
  LangExtention get lang => LangExtention(this);

  GeneralStringExtention get general => GeneralStringExtention(this);

}


