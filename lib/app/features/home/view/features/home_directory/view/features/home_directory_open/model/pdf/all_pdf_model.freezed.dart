// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_pdf_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AllPdfModel _$AllPdfModelFromJson(Map<String, dynamic> json) {
  return _AllPdfModel.fromJson(json);
}

/// @nodoc
mixin _$AllPdfModel {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  List<PdfModel?>? get allFiles => throw _privateConstructorUsedError;

  /// Serializes this AllPdfModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AllPdfModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AllPdfModelCopyWith<AllPdfModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllPdfModelCopyWith<$Res> {
  factory $AllPdfModelCopyWith(
          AllPdfModel value, $Res Function(AllPdfModel) then) =
      _$AllPdfModelCopyWithImpl<$Res, AllPdfModel>;
  @useResult
  $Res call({@HiveField(0) int? id, @HiveField(1) List<PdfModel?>? allFiles});
}

/// @nodoc
class _$AllPdfModelCopyWithImpl<$Res, $Val extends AllPdfModel>
    implements $AllPdfModelCopyWith<$Res> {
  _$AllPdfModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AllPdfModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? allFiles = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      allFiles: freezed == allFiles
          ? _value.allFiles
          : allFiles // ignore: cast_nullable_to_non_nullable
              as List<PdfModel?>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllPdfModelImplCopyWith<$Res>
    implements $AllPdfModelCopyWith<$Res> {
  factory _$$AllPdfModelImplCopyWith(
          _$AllPdfModelImpl value, $Res Function(_$AllPdfModelImpl) then) =
      __$$AllPdfModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) int? id, @HiveField(1) List<PdfModel?>? allFiles});
}

/// @nodoc
class __$$AllPdfModelImplCopyWithImpl<$Res>
    extends _$AllPdfModelCopyWithImpl<$Res, _$AllPdfModelImpl>
    implements _$$AllPdfModelImplCopyWith<$Res> {
  __$$AllPdfModelImplCopyWithImpl(
      _$AllPdfModelImpl _value, $Res Function(_$AllPdfModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AllPdfModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? allFiles = freezed,
  }) {
    return _then(_$AllPdfModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      allFiles: freezed == allFiles
          ? _value._allFiles
          : allFiles // ignore: cast_nullable_to_non_nullable
              as List<PdfModel?>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AllPdfModelImpl extends _AllPdfModel {
  _$AllPdfModelImpl(
      {@HiveField(0) this.id, @HiveField(1) final List<PdfModel?>? allFiles})
      : _allFiles = allFiles,
        super._();

  factory _$AllPdfModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AllPdfModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  final List<PdfModel?>? _allFiles;
  @override
  @HiveField(1)
  List<PdfModel?>? get allFiles {
    final value = _allFiles;
    if (value == null) return null;
    if (_allFiles is EqualUnmodifiableListView) return _allFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'AllPdfModel(id: $id, allFiles: $allFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllPdfModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._allFiles, _allFiles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_allFiles));

  /// Create a copy of AllPdfModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AllPdfModelImplCopyWith<_$AllPdfModelImpl> get copyWith =>
      __$$AllPdfModelImplCopyWithImpl<_$AllPdfModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AllPdfModelImplToJson(
      this,
    );
  }
}

abstract class _AllPdfModel extends AllPdfModel {
  factory _AllPdfModel(
      {@HiveField(0) final int? id,
      @HiveField(1) final List<PdfModel?>? allFiles}) = _$AllPdfModelImpl;
  _AllPdfModel._() : super._();

  factory _AllPdfModel.fromJson(Map<String, dynamic> json) =
      _$AllPdfModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  List<PdfModel?>? get allFiles;

  /// Create a copy of AllPdfModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AllPdfModelImplCopyWith<_$AllPdfModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
