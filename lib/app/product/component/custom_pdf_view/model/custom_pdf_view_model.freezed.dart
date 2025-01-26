// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_pdf_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CustomPdfViewModel _$CustomPdfViewModelFromJson(Map<String, dynamic> json) {
  return _CustomPdfViewModel.fromJson(json);
}

/// @nodoc
mixin _$CustomPdfViewModel {
  @HiveField(0)
  int? get id => throw _privateConstructorUsedError;
  @HiveField(1)
  PdfModel? get pdfModel => throw _privateConstructorUsedError;

  /// Serializes this CustomPdfViewModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CustomPdfViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomPdfViewModelCopyWith<CustomPdfViewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomPdfViewModelCopyWith<$Res> {
  factory $CustomPdfViewModelCopyWith(
          CustomPdfViewModel value, $Res Function(CustomPdfViewModel) then) =
      _$CustomPdfViewModelCopyWithImpl<$Res, CustomPdfViewModel>;
  @useResult
  $Res call({@HiveField(0) int? id, @HiveField(1) PdfModel? pdfModel});

  $PdfModelCopyWith<$Res>? get pdfModel;
}

/// @nodoc
class _$CustomPdfViewModelCopyWithImpl<$Res, $Val extends CustomPdfViewModel>
    implements $CustomPdfViewModelCopyWith<$Res> {
  _$CustomPdfViewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CustomPdfViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pdfModel = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pdfModel: freezed == pdfModel
          ? _value.pdfModel
          : pdfModel // ignore: cast_nullable_to_non_nullable
              as PdfModel?,
    ) as $Val);
  }

  /// Create a copy of CustomPdfViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PdfModelCopyWith<$Res>? get pdfModel {
    if (_value.pdfModel == null) {
      return null;
    }

    return $PdfModelCopyWith<$Res>(_value.pdfModel!, (value) {
      return _then(_value.copyWith(pdfModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CustomPdfViewModelImplCopyWith<$Res>
    implements $CustomPdfViewModelCopyWith<$Res> {
  factory _$$CustomPdfViewModelImplCopyWith(_$CustomPdfViewModelImpl value,
          $Res Function(_$CustomPdfViewModelImpl) then) =
      __$$CustomPdfViewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@HiveField(0) int? id, @HiveField(1) PdfModel? pdfModel});

  @override
  $PdfModelCopyWith<$Res>? get pdfModel;
}

/// @nodoc
class __$$CustomPdfViewModelImplCopyWithImpl<$Res>
    extends _$CustomPdfViewModelCopyWithImpl<$Res, _$CustomPdfViewModelImpl>
    implements _$$CustomPdfViewModelImplCopyWith<$Res> {
  __$$CustomPdfViewModelImplCopyWithImpl(_$CustomPdfViewModelImpl _value,
      $Res Function(_$CustomPdfViewModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CustomPdfViewModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? pdfModel = freezed,
  }) {
    return _then(_$CustomPdfViewModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      pdfModel: freezed == pdfModel
          ? _value.pdfModel
          : pdfModel // ignore: cast_nullable_to_non_nullable
              as PdfModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomPdfViewModelImpl extends _CustomPdfViewModel {
  _$CustomPdfViewModelImpl({@HiveField(0) this.id, @HiveField(1) this.pdfModel})
      : super._();

  factory _$CustomPdfViewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomPdfViewModelImplFromJson(json);

  @override
  @HiveField(0)
  final int? id;
  @override
  @HiveField(1)
  final PdfModel? pdfModel;

  @override
  String toString() {
    return 'CustomPdfViewModel(id: $id, pdfModel: $pdfModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomPdfViewModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.pdfModel, pdfModel) ||
                other.pdfModel == pdfModel));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, pdfModel);

  /// Create a copy of CustomPdfViewModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomPdfViewModelImplCopyWith<_$CustomPdfViewModelImpl> get copyWith =>
      __$$CustomPdfViewModelImplCopyWithImpl<_$CustomPdfViewModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomPdfViewModelImplToJson(
      this,
    );
  }
}

abstract class _CustomPdfViewModel extends CustomPdfViewModel {
  factory _CustomPdfViewModel(
      {@HiveField(0) final int? id,
      @HiveField(1) final PdfModel? pdfModel}) = _$CustomPdfViewModelImpl;
  _CustomPdfViewModel._() : super._();

  factory _CustomPdfViewModel.fromJson(Map<String, dynamic> json) =
      _$CustomPdfViewModelImpl.fromJson;

  @override
  @HiveField(0)
  int? get id;
  @override
  @HiveField(1)
  PdfModel? get pdfModel;

  /// Create a copy of CustomPdfViewModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomPdfViewModelImplCopyWith<_$CustomPdfViewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
