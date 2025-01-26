// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_directory_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicDirectoryModelImpl _$$PublicDirectoryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PublicDirectoryModelImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      fileListKey: (json['fileListKey'] as num?)?.toInt(),
      color: json['color'] as String?,
      fileType: json['fileType'] as String?,
    );

Map<String, dynamic> _$$PublicDirectoryModelImplToJson(
        _$PublicDirectoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'fileListKey': instance.fileListKey,
      'color': instance.color,
      'fileType': instance.fileType,
    };
