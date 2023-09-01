// ignore_for_file: void_checks

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:second_task_flutter/model/categoriesnames.dart';

part 'remove_tile_provider.g.dart';

@riverpod
class RemoveTileProvider extends _$RemoveTileProvider {

  @override
  List<CategoriesNames> build() {
    return [];
  }

  void removeAtIndex(CategoriesNames category, int index) {
    print("Shariq bhaiya hello $index");
    print("Muskan didi hello $category");
    final List<CategoriesNames> currentList = state;

    currentList.removeAt(currentList.indexOf(category));

    state = currentList;
  }
}
