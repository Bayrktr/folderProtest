import 'package:flutter/material.dart';

enum FileTypeEnum {
  pdf,
}

extension FileTypeEnumExtention on FileTypeEnum {
  IconData get getIconData {
    switch (this) {
      case FileTypeEnum.pdf:
        return Icons.library_books_outlined;
    }
  }

  String get getFileName {
    switch (this) {
      case FileTypeEnum.pdf:
        return 'Pdf';
    }
  }
}
