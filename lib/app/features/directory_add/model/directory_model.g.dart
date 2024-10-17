// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DirectoryModelAdapter extends TypeAdapter<DirectoryModel> {
  @override
  final int typeId = 1;

  @override
  DirectoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DirectoryModel(
      id: fields[1] as int?,
      name: fields[2] as String?,
      pdfListKey: fields[3] as int?,
      tagColor: fields[4] as Color?,
    );
  }

  @override
  void write(BinaryWriter writer, DirectoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.pdfListKey)
      ..writeByte(4)
      ..write(obj.tagColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DirectoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectoryModelImpl _$$DirectoryModelImplFromJson(Map<String, dynamic> json) =>
    _$DirectoryModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      pdfListKey: (json['pdfListKey'] as num?)?.toInt(),
      tagColor: _colorFromJson((json['tagColor'] as num?)?.toInt()),
    );

Map<String, dynamic> _$$DirectoryModelImplToJson(
        _$DirectoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'pdfListKey': instance.pdfListKey,
      'tagColor': _colorToJson(instance.tagColor),
    };
