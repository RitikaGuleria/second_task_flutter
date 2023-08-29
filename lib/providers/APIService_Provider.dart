
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:second_task_flutter/model/categoriesnames.dart';

part 'APIService_Provider.g.dart';

@riverpod
class APIService_Provider extends _$APIService_Provider{

  @override
  Future<List<CategoriesNames>> build() async{
    return [];
  }

  Future<List<CategoriesNames>> fetchCategories() async{
    state = const AsyncValue.loading();
    try{
      final dio = Dio();
      final response = await dio.get('https://www.themealdb.com/api/json/v1/1/categories.php');
      final json = response.data['categories']! as List;
      final userData = json.map((item) => CategoriesNames.fromJson(item)).toList();
      print("12 $userData");
      state = AsyncData(userData);
      return userData;
    }
    catch(error,stackTrace){
      state = AsyncValue.error(error.toString(), stackTrace);
      return [];
    }
  }

}



