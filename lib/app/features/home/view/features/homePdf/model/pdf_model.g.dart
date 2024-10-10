// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pdf_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PdfModelImpl _$$PdfModelImplFromJson(Map<String, dynamic> json) =>
    _$PdfModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$PdfModelImplToJson(_$PdfModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
    };
