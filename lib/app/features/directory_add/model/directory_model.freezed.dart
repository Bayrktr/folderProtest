// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'directory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DirectoryModel _$DirectoryModelFromJson(Map<String, dynamic> json) {
  return _DirectoryModel.fromJson(json);
}

/// @nodoc
mixin _$DirectoryModel {
  @HiveField(1)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(3)
  int? get pdfListKey => throw _privateConstructorUsedError;
  @HiveField(4)
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  Color? get tagColor => throw _privateConstructorUsedError;

  /// Serializes this DirectoryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DirectoryModelCopyWith<DirectoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DirectoryModelCopyWith<$Res> {
  factory $DirectoryModelCopyWith(
          DirectoryModel value, $Res Function(DirectoryModel) then) =
      _$DirectoryModelCopyWithImpl<$Res, DirectoryModel>;
  @useResult
  $Res call(
      {@HiveField(1) int? id,
      @HiveField(2) String? name,
      @HiveField(3) int? pdfListKey,
      @HiveField(4)
      @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
      Color? tagColor});
}

/// @nodoc
class _$DirectoryModelCopyWithImpl<$Res, $Val extends DirectoryModel>
    implements $DirectoryModelCopyWith<$Res> {
  _$DirectoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? pdfListKey = freezed,
    Object? tagColor = freezed,
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
      pdfListKey: freezed == pdfListKey
          ? _value.pdfListKey
          : pdfListKey // ignore: cast_nullable_to_non_nullable
              as int?,
      tagColor: freezed == tagColor
          ? _value.tagColor
          : tagColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DirectoryModelImplCopyWith<$Res>
    implements $DirectoryModelCopyWith<$Res> {
  factory _$$DirectoryModelImplCopyWith(_$DirectoryModelImpl value,
          $Res Function(_$DirectoryModelImpl) then) =
      __$$DirectoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) int? id,
      @HiveField(2) String? name,
      @HiveField(3) int? pdfListKey,
      @HiveField(4)
      @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
      Color? tagColor});
}

/// @nodoc
class __$$DirectoryModelImplCopyWithImpl<$Res>
    extends _$DirectoryModelCopyWithImpl<$Res, _$DirectoryModelImpl>
    implements _$$DirectoryModelImplCopyWith<$Res> {
  __$$DirectoryModelImplCopyWithImpl(
      _$DirectoryModelImpl _value, $Res Function(_$DirectoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of DirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? pdfListKey = freezed,
    Object? tagColor = freezed,
  }) {
    return _then(_$DirectoryModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfListKey: freezed == pdfListKey
          ? _value.pdfListKey
          : pdfListKey // ignore: cast_nullable_to_non_nullable
              as int?,
      tagColor: freezed == tagColor
          ? _value.tagColor
          : tagColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DirectoryModelImpl extends _DirectoryModel {
  _$DirectoryModelImpl(
      {@HiveField(1) this.id,
      @HiveField(2) this.name,
      @HiveField(3) this.pdfListKey,
      @HiveField(4)
      @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
      this.tagColor})
      : super._();

  factory _$DirectoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DirectoryModelImplFromJson(json);

  @override
  @HiveField(1)
  final int? id;
  @override
  @HiveField(2)
  final String? name;
  @override
  @HiveField(3)
  final int? pdfListKey;
  @override
  @HiveField(4)
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color? tagColor;

  @override
  String toString() {
    return 'DirectoryModel(id: $id, name: $name, pdfListKey: $pdfListKey, tagColor: $tagColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DirectoryModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.pdfListKey, pdfListKey) ||
                other.pdfListKey == pdfListKey) &&
            (identical(other.tagColor, tagColor) ||
                other.tagColor == tagColor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, pdfListKey, tagColor);

  /// Create a copy of DirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DirectoryModelImplCopyWith<_$DirectoryModelImpl> get copyWith =>
      __$$DirectoryModelImplCopyWithImpl<_$DirectoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DirectoryModelImplToJson(
      this,
    );
  }
}

abstract class _DirectoryModel extends DirectoryModel {
  factory _DirectoryModel(
      {@HiveField(1) final int? id,
      @HiveField(2) final String? name,
      @HiveField(3) final int? pdfListKey,
      @HiveField(4)
      @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
      final Color? tagColor}) = _$DirectoryModelImpl;
  _DirectoryModel._() : super._();

  factory _DirectoryModel.fromJson(Map<String, dynamic> json) =
      _$DirectoryModelImpl.fromJson;

  @override
  @HiveField(1)
  int? get id;
  @override
  @HiveField(2)
  String? get name;
  @override
  @HiveField(3)
  int? get pdfListKey;
  @override
  @HiveField(4)
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  Color? get tagColor;

  /// Create a copy of DirectoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DirectoryModelImplCopyWith<_$DirectoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
