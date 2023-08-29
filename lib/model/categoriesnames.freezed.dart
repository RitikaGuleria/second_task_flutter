// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categoriesnames.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CategoriesNames _$CategoriesNamesFromJson(Map<String, dynamic> json) {
  return _CategoriesNames.fromJson(json);
}

/// @nodoc
mixin _$CategoriesNames {
  String get idCategory => throw _privateConstructorUsedError;
  String get strCategory => throw _privateConstructorUsedError;
  String get strCategoryThumb => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CategoriesNamesCopyWith<CategoriesNames> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesNamesCopyWith<$Res> {
  factory $CategoriesNamesCopyWith(
          CategoriesNames value, $Res Function(CategoriesNames) then) =
      _$CategoriesNamesCopyWithImpl<$Res, CategoriesNames>;
  @useResult
  $Res call({String idCategory, String strCategory, String strCategoryThumb});
}

/// @nodoc
class _$CategoriesNamesCopyWithImpl<$Res, $Val extends CategoriesNames>
    implements $CategoriesNamesCopyWith<$Res> {
  _$CategoriesNamesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = null,
    Object? strCategory = null,
    Object? strCategoryThumb = null,
  }) {
    return _then(_value.copyWith(
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
      strCategory: null == strCategory
          ? _value.strCategory
          : strCategory // ignore: cast_nullable_to_non_nullable
              as String,
      strCategoryThumb: null == strCategoryThumb
          ? _value.strCategoryThumb
          : strCategoryThumb // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CategoriesNamesCopyWith<$Res>
    implements $CategoriesNamesCopyWith<$Res> {
  factory _$$_CategoriesNamesCopyWith(
          _$_CategoriesNames value, $Res Function(_$_CategoriesNames) then) =
      __$$_CategoriesNamesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idCategory, String strCategory, String strCategoryThumb});
}

/// @nodoc
class __$$_CategoriesNamesCopyWithImpl<$Res>
    extends _$CategoriesNamesCopyWithImpl<$Res, _$_CategoriesNames>
    implements _$$_CategoriesNamesCopyWith<$Res> {
  __$$_CategoriesNamesCopyWithImpl(
      _$_CategoriesNames _value, $Res Function(_$_CategoriesNames) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = null,
    Object? strCategory = null,
    Object? strCategoryThumb = null,
  }) {
    return _then(_$_CategoriesNames(
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
      strCategory: null == strCategory
          ? _value.strCategory
          : strCategory // ignore: cast_nullable_to_non_nullable
              as String,
      strCategoryThumb: null == strCategoryThumb
          ? _value.strCategoryThumb
          : strCategoryThumb // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CategoriesNames implements _CategoriesNames {
  const _$_CategoriesNames(
      {required this.idCategory,
      required this.strCategory,
      required this.strCategoryThumb});

  factory _$_CategoriesNames.fromJson(Map<String, dynamic> json) =>
      _$$_CategoriesNamesFromJson(json);

  @override
  final String idCategory;
  @override
  final String strCategory;
  @override
  final String strCategoryThumb;

  @override
  String toString() {
    return 'CategoriesNames(idCategory: $idCategory, strCategory: $strCategory, strCategoryThumb: $strCategoryThumb)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CategoriesNames &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.strCategory, strCategory) ||
                other.strCategory == strCategory) &&
            (identical(other.strCategoryThumb, strCategoryThumb) ||
                other.strCategoryThumb == strCategoryThumb));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idCategory, strCategory, strCategoryThumb);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CategoriesNamesCopyWith<_$_CategoriesNames> get copyWith =>
      __$$_CategoriesNamesCopyWithImpl<_$_CategoriesNames>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CategoriesNamesToJson(
      this,
    );
  }
}

abstract class _CategoriesNames implements CategoriesNames {
  const factory _CategoriesNames(
      {required final String idCategory,
      required final String strCategory,
      required final String strCategoryThumb}) = _$_CategoriesNames;

  factory _CategoriesNames.fromJson(Map<String, dynamic> json) =
      _$_CategoriesNames.fromJson;

  @override
  String get idCategory;
  @override
  String get strCategory;
  @override
  String get strCategoryThumb;
  @override
  @JsonKey(ignore: true)
  _$$_CategoriesNamesCopyWith<_$_CategoriesNames> get copyWith =>
      throw _privateConstructorUsedError;
}
