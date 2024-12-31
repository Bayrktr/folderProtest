import 'package:DocuSort/app/product/model/directory/directory_base_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'public_directory_model.freezed.dart';

part 'public_directory_model.g.dart';


@freezed
class PublicDirectoryModel extends DirectoryFirebaseModel<PublicDirectoryModel>
    with _$PublicDirectoryModel
    implements DirectoryImplementBaseModel<PublicDirectoryModel> {
  factory PublicDirectoryModel({
    int? id,
    String? name,
    int? fileListKey,
    String? color,
    String? fileType,
  }) = _PublicDirectoryModel;

  factory PublicDirectoryModel.fromJson(Map<String, dynamic> json) =>
      _$PublicDirectoryModelFromJson(json);

  PublicDirectoryModel._();

  @override
  PublicDirectoryModel fromJson(Map<String, dynamic> json) {
    throw UnimplementedError();
  }
}
