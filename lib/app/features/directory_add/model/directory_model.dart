import 'package:DocuSort/app/product/cache/hive/model/hive_model.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'directory_model.freezed.dart';
part 'directory_model.g.dart';

@freezed
@HiveType(typeId: 1)
class DirectoryModel with _$DirectoryModel, HiveModelMixin {
  factory DirectoryModel({
    @HiveField(1) int? id,
    @HiveField(2) String? name,
    @HiveField(3) int? fileListKey,
    @HiveField(4)
    @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
    @Default(Colors.black)
    Color? tagColor,
    @HiveField(5) FileTypeEnum? fileTypeEnum,
  }) = _DirectoryModel;

  factory DirectoryModel.fromJson(Map<String, dynamic> json) =>
      _$DirectoryModelFromJson(json);

  DirectoryModel._();

  @override
  String get key => id.toString();
}

Color? _colorFromJson(int? colorValue) {
  if (colorValue == null) return null;
  return Color(colorValue);
}

int? _colorToJson(Color? color) {
  if (color == null) return null;
  return color.value;
}
