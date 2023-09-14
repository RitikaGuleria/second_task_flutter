
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:second_task_flutter/di/dioClientProvider.dart';
import 'package:second_task_flutter/model/categoriesnames.dart';
import 'package:second_task_flutter/repository/categories_list_repository_provider.dart';

part 'providers.g.dart';

@riverpod
class Providers extends _$Providers {
  @override
  Future<List<CategoriesNames>> build() async {
    return [];
  }

  Future<void> fetchUserDetails() async {
    try {
      final userData = await ref.read(userListRepositoryProvider).getUserData();
      print("UserData: $userData");
      state = AsyncValue.data(userData);
    } on DioException catch (e) {
      state = AsyncValue.error(
          "Error searching user response: $e", StackTrace.current);
    } catch (e) {
      state = AsyncValue.error("Error searching products: $e", StackTrace.current);
    }
  }

  Future<void> deleteTile(int index) async
  {
    state.when(
      data: (categoryData) {
        if (index >= 0 && index < categoryData.length) {
          final updatedList = List.of(categoryData);
          updatedList.removeAt(index);
          state = AsyncData(updatedList);
        }
      },
      error: (Object error, StackTrace stackTrace) {},
      loading: () {},
    );
  }
  // void removeTileAtIndex(CategoriesNames category, int index)
    // {
    //   final List<CategoriesNames> currentList = state;
    //   currentList.removeAt(currentList.indexOf(category));
    //   state = currentList;
    // }

  Future<void> increase(int index) async {
    state.when(
        data: (categoryData) {
          if (index >= 0 && index < categoryData.length) {
            final nl = List.of(categoryData);
            CategoriesNames oldvalue = nl[index];
            CategoriesNames newValue = oldvalue.copyWith(
                count: oldvalue.count + 1);
            nl[index] = newValue;
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
            if(oldvalue.count>0){
              CategoriesNames newValue = oldvalue.copyWith(count: oldvalue.count - 1);
              nl[index] = newValue;
            }
            state = AsyncData(nl);
          }
        },
        error: (Object error, StackTrace stackTrace) {},
        loading: () {});
  }

  Future<void> searchAndUpdateNewList(String query) async{

    state.when(data:(categoryData)
    {
      final originalList = List.of(categoryData);
      final List<CategoriesNames> nl = [];

      if(query.isNotEmpty){
        final result = categoryData.where((element) =>  element.strCategory.toString().toLowerCase().startsWith(query.toString().toLowerCase())).toSet().toList();
        // .contains(query.toString().toLowerCase())).toSet().toList();
        nl.addAll(result);
        state = AsyncData(nl);
      }
      else{
        state = AsyncData(originalList);
      }
    } ,
        error: (Object error,StackTrace stackTrace){},
        loading: (){});
  }
  // Future<List<CategoriesNames>> fetchCategories() async {
    //   // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   //   ref.read(dioProvider);
    //   // });
    //
    //   state = const AsyncValue.loading();
    //   try {
    //     final dio = Dio();
    //     final response = await dio.get("https://www.themealdb.com/api/json/v1/1/categories.php");
    //     final json = response.data['categories']! as List;
    //     final userData = json.map((item) => CategoriesNames.fromJson(item)).toList();
    //     print("12 $userData");
    //     state = AsyncData(userData);
    //     return userData;
    //   } catch (error, stackTrace) {
    //     state = AsyncValue.error(error.toString(), stackTrace);
    //     return [];
    //   }
    // }
  Future<List<Map<String, dynamic>>> fetchDataForCategoriesList() async {
    final dio = Dio();
    final response = await dio.get('https://jsonplaceholder.typicode.com/todos');

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = response.data;
      return jsonData.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load data from JSONPlaceholder API');
    }
  }

}