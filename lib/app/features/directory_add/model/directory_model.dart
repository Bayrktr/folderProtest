import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:pdf_app/app/features/home/view/features/home_pdf/model/pdf_model.dart';

part 'directory_model.freezed.dart';
part 'directory_model.g.dart';

@freezed
@HiveType(typeId: 1)
class DirectoryModel with _$DirectoryModel {
  factory DirectoryModel({
    @HiveField(1) int? id,
    @HiveField(2) String? name,
    @HiveField(3) int? pdfListKey,
    @HiveField(4)
    @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
    Color? tagColor,
  }) = _DirectoryModel;

  factory DirectoryModel.fromJson(Map<String, dynamic> json) =>
      _$DirectoryModelFromJson(json);

  DirectoryModel._();
}

Color? _colorFromJson(int? colorValue) {
  if (colorValue == null) return null;
  return Color(colorValue);
}

int? _colorToJson(Color? color) {
  if (color == null) return null;
  return color.value;
}
