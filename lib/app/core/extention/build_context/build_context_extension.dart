import 'package:flutter/material.dart';
import 'package:DocuSort/app/core/extention/build_context/padding_extension.dart';
import 'package:DocuSort/app/core/extention/build_context/sized_extension.dart';
import 'package:DocuSort/app/core/extention/build_context/theme_extention.dart';

/// BuildContext extension
extension BuildContextExtension on BuildContext {
  /// sized context
  ContextSizeExtension get sized => ContextSizeExtension(this);

  /// padding context
  PaddingExtensionClass get padding => PaddingExtensionClass(this);

  ///theme context

  CustomThemeExtention get theme => CustomThemeExtention(this);
}
