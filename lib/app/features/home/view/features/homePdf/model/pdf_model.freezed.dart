// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PdfModel _$PdfModelFromJson(Map<String, dynamic> json) {
  return _PdfModel.fromJson(json);
}

/// @nodoc
mixin _$PdfModel {
  @HiveField(1)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get name => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get path => throw _privateConstructorUsedError;

  /// Serializes this PdfModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PdfModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PdfModelCopyWith<PdfModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PdfModelCopyWith<$Res> {
  factory $PdfModelCopyWith(PdfModel value, $Res Function(PdfModel) then) =
      _$PdfModelCopyWithImpl<$Res, PdfModel>;
  @useResult
  $Res call(
      {@HiveField(1) int? id,
      @HiveField(2) String? name,
      @HiveField(3) String? path});
}

/// @nodoc
class _$PdfModelCopyWithImpl<$Res, $Val extends PdfModel>
    implements $PdfModelCopyWith<$Res> {
  _$PdfModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PdfModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? path = freezed,
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
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PdfModelImplCopyWith<$Res>
    implements $PdfModelCopyWith<$Res> {
  factory _$$PdfModelImplCopyWith(
          _$PdfModelImpl value, $Res Function(_$PdfModelImpl) then) =
      __$$PdfModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) int? id,
      @HiveField(2) String? name,
      @HiveField(3) String? path});
}

/// @nodoc
class __$$PdfModelImplCopyWithImpl<$Res>
    extends _$PdfModelCopyWithImpl<$Res, _$PdfModelImpl>
    implements _$$PdfModelImplCopyWith<$Res> {
  __$$PdfModelImplCopyWithImpl(
      _$PdfModelImpl _value, $Res Function(_$PdfModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PdfModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? path = freezed,
  }) {
    return _then(_$PdfModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PdfModelImpl extends _PdfModel {
  _$PdfModelImpl(
      {@HiveField(1) this.id, @HiveField(2) this.name, @HiveField(3) this.path})
      : super._();

  factory _$PdfModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PdfModelImplFromJson(json);

  @override
  @HiveField(1)
  final int? id;
  @override
  @HiveField(2)
  final String? name;
  @override
  @HiveField(3)
  final String? path;

  @override
  String toString() {
    return 'PdfModel(id: $id, name: $name, path: $path)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PdfModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, path);

  /// Create a copy of PdfModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PdfModelImplCopyWith<_$PdfModelImpl> get copyWith =>
      __$$PdfModelImplCopyWithImpl<_$PdfModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PdfModelImplToJson(
      this,
    );
  }
}

abstract class _PdfModel extends PdfModel {
  factory _PdfModel(
      {@HiveField(1) final int? id,
      @HiveField(2) final String? name,
      @HiveField(3) final String? path}) = _$PdfModelImpl;
  _PdfModel._() : super._();

  factory _PdfModel.fromJson(Map<String, dynamic> json) =
      _$PdfModelImpl.fromJson;

  @override
  @HiveField(1)
  int? get id;
  @override
  @HiveField(2)
  String? get name;
  @override
  @HiveField(3)
  String? get path;

  /// Create a copy of PdfModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PdfModelImplCopyWith<_$PdfModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
