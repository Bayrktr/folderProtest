import 'package:DocuSort/app/core/extention/string/general_string_extention.dart';
import 'package:DocuSort/app/core/extention/string/lang_extention.dart';

extension StringExtention on String {
  LangExtention get lang => LangExtention(this);

  GeneralStringExtention get general => GeneralStringExtention(this);

}


