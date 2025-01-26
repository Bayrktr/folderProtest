// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_directory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublicDirectoryModel _$PublicDirectoryModelFromJson(Map<String, dynamic> json) {
  return _PublicDirectoryModel.fromJson(json);
}

/// @nodoc
mixin _$PublicDirectoryModel {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get fileListKey => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  String? get fileType => throw _privateConstructorUsedError;

  /// Serializes this PublicDirectoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublicDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublicDirectoryModelCopyWith<PublicDirectoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicDirectoryModelCopyWith<$Res> {
  factory $PublicDirectoryModelCopyWith(PublicDirectoryModel value,
          $Res Function(PublicDirectoryModel) then) =
      _$PublicDirectoryModelCopyWithImpl<$Res, PublicDirectoryModel>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? fileListKey,
      String? color,
      String? fileType});
}

/// @nodoc
class _$PublicDirectoryModelCopyWithImpl<$Res,
        $Val extends PublicDirectoryModel>
    implements $PublicDirectoryModelCopyWith<$Res> {
  _$PublicDirectoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublicDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? fileListKey = freezed,
    Object? color = freezed,
    Object? fileType = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fileListKey: freezed == fileListKey
          ? _value.fileListKey
          : fileListKey // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicDirectoryModelImplCopyWith<$Res>
    implements $PublicDirectoryModelCopyWith<$Res> {
  factory _$$PublicDirectoryModelImplCopyWith(_$PublicDirectoryModelImpl value,
          $Res Function(_$PublicDirectoryModelImpl) then) =
      __$$PublicDirectoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      int? fileListKey,
      String? color,
      String? fileType});
}

/// @nodoc
class __$$PublicDirectoryModelImplCopyWithImpl<$Res>
    extends _$PublicDirectoryModelCopyWithImpl<$Res, _$PublicDirectoryModelImpl>
    implements _$$PublicDirectoryModelImplCopyWith<$Res> {
  __$$PublicDirectoryModelImplCopyWithImpl(_$PublicDirectoryModelImpl _value,
      $Res Function(_$PublicDirectoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PublicDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? fileListKey = freezed,
    Object? color = freezed,
    Object? fileType = freezed,
  }) {
    return _then(_$PublicDirectoryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      fileListKey: freezed == fileListKey
          ? _value.fileListKey
          : fileListKey // ignore: cast_nullable_to_non_nullable
              as int?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicDirectoryModelImpl extends _PublicDirectoryModel {
  _$PublicDirectoryModelImpl(
      {this.id, this.name, this.fileListKey, this.color, this.fileType})
      : super._();

  factory _$PublicDirectoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicDirectoryModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final int? fileListKey;
  @override
  final String? color;
  @override
  final String? fileType;

  @override
  String toString() {
    return 'PublicDirectoryModel(id: $id, name: $name, fileListKey: $fileListKey, color: $color, fileType: $fileType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicDirectoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fileListKey, fileListKey) ||
                other.fileListKey == fileListKey) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, fileListKey, color, fileType);

  /// Create a copy of PublicDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicDirectoryModelImplCopyWith<_$PublicDirectoryModelImpl>
      get copyWith =>
          __$$PublicDirectoryModelImplCopyWithImpl<_$PublicDirectoryModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicDirectoryModelImplToJson(
      this,
    );
  }
}

abstract class _PublicDirectoryModel extends PublicDirectoryModel {
  factory _PublicDirectoryModel(
      {final int? id,
      final String? name,
      final int? fileListKey,
      final String? color,
      final String? fileType}) = _$PublicDirectoryModelImpl;
  _PublicDirectoryModel._() : super._();

  factory _PublicDirectoryModel.fromJson(Map<String, dynamic> json) =
      _$PublicDirectoryModelImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  int? get fileListKey;
  @override
  String? get color;
  @override
  String? get fileType;

  /// Create a copy of PublicDirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicDirectoryModelImplCopyWith<_$PublicDirectoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
