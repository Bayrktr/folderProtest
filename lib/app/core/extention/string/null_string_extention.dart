import 'package:pdf_app/app/core/extention/string/null_check_extention.dart';

extension NullStringExtention on String? {
  NullCheckExtention get forNull => NullCheckExtention(this);
}