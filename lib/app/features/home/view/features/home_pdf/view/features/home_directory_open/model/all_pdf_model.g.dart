// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_pdf_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AllPdfModelAdapter extends TypeAdapter<AllPdfModel> {
  @override
  final int typeId = 7;

  @override
  AllPdfModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AllPdfModel(
      id: fields[0] as int?,
      allPdf: (fields[1] as List?)?.cast<PdfModel?>(),
    );
  }

  @override
  void write(BinaryWriter writer, AllPdfModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.allPdf);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AllPdfModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AllPdfModelImpl _$$AllPdfModelImplFromJson(Map<String, dynamic> json) =>
    _$AllPdfModelImpl(
      id: (json['id'] as num?)?.toInt(),
      allPdf: (json['allPdf'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : PdfModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AllPdfModelImplToJson(_$AllPdfModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'allPdf': instance.allPdf,
    };
