
import 'package:flutter/material.dart';

enum IconsEnum {
  google('google'),
  ;

  final String value;

  const IconsEnum(this.value);

  String get toIcon => 'asset/image/icons/$value.png';

  Image get toIconAsset => Image.asset(toIcon);
}