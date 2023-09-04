import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:second_task_flutter/di/dioClientProvider.dart';
import 'package:second_task_flutter/model/categoriesnames.dart';

part 'APIService_Provider.g.dart';

@riverpod
class APIService_Provider extends _$APIService_Provider {
  @override
  Future<List<CategoriesNames>> build() async {
    return [];
  }

  Future<List<CategoriesNames>> fetchCategories() async {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dioProvider);
    });

    state = const AsyncValue.loading();
    try {
      final dio = Dio();
      final response = await dio.get("https://www.themealdb.com/api/json/v1/1/categories.php");
      final json = response.data['categories']! as List;
      final userData =
          json.map((item) => CategoriesNames.fromJson(item)).toList();
      print("12 $userData");
      state = AsyncData(userData);
      return userData;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error.toString(), stackTrace);
      return [];
    }
  }

  Future<void> deleteTile(int index) async {
    state.when(
      data: (categoryData) {
        if (index >= 0 && index < categoryData.length ) {
          final updatedList = List.of(categoryData);
          updatedList.removeAt(index);
          state = AsyncData(updatedList);
        }
      },
      error: (Object error, StackTrace stackTrace) {},
      loading: () {},
    );
  }


  Future<void> increase(int index) async {
    state.when(
        data: (categoryData) {
          if (index >= 0 && index < categoryData.length) {
            final nl = List.of(categoryData);
            CategoriesNames oldvalue = nl[index];
            CategoriesNames newValue = oldvalue.copyWith(count: oldvalue.count+1);
            nl[index]=newValue;
            state = AsyncData(nl);
          }
        },
        error: (Object error, StackTrace stackTrace) {},
        loading: () {});
  }

  Future<void> decrease(int index) async {
    state.when(
        data: (categoryData) {
          if (index >= 0 && index < categoryData.length ) {
            final nl = List.of(categoryData);
            CategoriesNames oldvalue = nl[index];
            CategoriesNames newValue = oldvalue.copyWith(count: oldvalue.count-1);
            nl[index]=newValue;
            state = AsyncData(nl);
          }
        },
        error: (Object error, StackTrace stackTrace) {},
        loading: () {});
  }
}
