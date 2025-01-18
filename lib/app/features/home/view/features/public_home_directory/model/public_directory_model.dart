import 'package:DocuSort/app/product/converter/file_type_converter.dart';
import 'package:DocuSort/app/product/enum/file_type_enum.dart';
import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:DocuSort/app/product/service/database/firebase/model/base_firebase_model.dart';
import 'package:equatable/equatable.dart';

class PublicDirectoryModel extends Equatable
    with BaseFirebaseModel<PublicDirectoryModel>
    implements BaseDirectoryModel {
  const PublicDirectoryModel({
    this.name,
    this.fileListKey,
    this.fileType,
    this.tagColor,
    this.id,
  });

  final String? name;
  final int? fileListKey;
  final String? fileType;
  final String? tagColor;
  final int? id;

  @override
  PublicDirectoryModel fromJson(Map<String, dynamic> json) {
    return PublicDirectoryModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      fileListKey: json['fileListKey'] as int?,
      fileType: json['fileType'] as String?,
      tagColor: json['tagColor'] as String?,
    );
  }

  @override
  List<Object?> get props => [
        name,
        fileListKey,
        fileType,
        tagColor,
        id,
      ];

  @override
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'fileListKey': fileListKey,
      'fileType': fileType,
      'tagColor': tagColor,
      'id': id,
    };
  }

  @override
  FileTypeEnum? get fileTypeEnum => FileTypeConverter(fileType).toFileTypeEnum;

  @override
  BaseDirectoryModel copyWith({
    int? id,
    String? name,
    int? fileListKey,
    FileTypeEnum? fileTypeEnum,
    String? tagColor,
  }) {
    return PublicDirectoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      fileListKey: fileListKey ?? this.fileListKey,
      fileType: fileType,
      tagColor: tagColor ?? this.tagColor,
    );
  }
}
