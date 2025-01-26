import 'package:hive/hive.dart';
import 'package:flutter/material.dart';

class MaterialColorAdapter extends TypeAdapter<MaterialColor> {
  @override
  final typeId = 3; // Unique ID for this adapter

  @override
  MaterialColor read(BinaryReader reader) {
    final int value = reader.readInt();
    return Colors.primaries.firstWhere((color) => color.value == value);
  }

  @override
  void write(BinaryWriter writer, MaterialColor obj) {
    writer.writeInt(obj.value);
  }
}
