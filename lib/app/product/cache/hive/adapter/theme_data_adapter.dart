import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemeDataAdapter extends TypeAdapter<ThemeData> {
  @override
  final typeId = 6; // Unique ID for this adapter

  @override
  ThemeData read(BinaryReader reader) {
    final primaryColorValue = reader.readInt();
    return ThemeData(primaryColor: Color(primaryColorValue));
  }

  @override
  void write(BinaryWriter writer, ThemeData obj) {
    writer.writeInt(obj.primaryColor.value);
  }
}
