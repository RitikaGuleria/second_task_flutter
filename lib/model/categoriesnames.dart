import 'package:freezed_annotation/freezed_annotation.dart';

part "categoriesnames.freezed.dart";
part "categoriesnames.g.dart";

@freezed
class CategoriesNames with _$CategoriesNames {
  const factory CategoriesNames(
      {required String idCategory,
      required String strCategory,
      required String strCategoryThumb,
      @Default(0) int count,
      }) = _CategoriesNames;

  factory CategoriesNames.fromJson(Map<String, dynamic> json) => _$CategoriesNamesFromJson(json);

}
