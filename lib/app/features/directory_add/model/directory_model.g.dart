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
      fileListKey: fields[3] as int?,
      tagColor: fields[4] as Color?,
      fileTypeEnum: fields[5] as FileTypeEnum?,
    );
  }

  @override
  void write(BinaryWriter writer, DirectoryModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.fileListKey)
      ..writeByte(4)
      ..write(obj.tagColor)
      ..writeByte(5)
      ..write(obj.fileTypeEnum);
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
      fileListKey: (json['fileListKey'] as num?)?.toInt(),
      tagColor: json['tagColor'] == null
          ? Colors.black
          : _colorFromJson((json['tagColor'] as num?)?.toInt()),
      fileTypeEnum:
          $enumDecodeNullable(_$FileTypeEnumEnumMap, json['fileTypeEnum']),
    );

Map<String, dynamic> _$$DirectoryModelImplToJson(
        _$DirectoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fileListKey': instance.fileListKey,
      'tagColor': _colorToJson(instance.tagColor),
      'fileTypeEnum': _$FileTypeEnumEnumMap[instance.fileTypeEnum],
    };

const _$FileTypeEnumEnumMap = {
  FileTypeEnum.pdf: 'pdf',
};
