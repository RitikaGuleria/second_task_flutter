import 'package:dio/dio.dart';

import '../model/categoriesnames.dart';

class UserListRepository{
  final Dio client;

  UserListRepository({required this.client});

  Future<List<CategoriesNames>> getUserData() async
  {
      try{
        final response = await client.get("categories.php");
        print("API Response: $response");

        if(response.statusCode==200)
        {
          final jsonData = response.data['categories']! as List;
          final result = jsonData.map((item) => CategoriesNames.fromJson(item)).toList();
          return result;
        }else{
          throw Exception("Failed to load data");
        }
      }
      catch(e) {
        rethrow;
      }
  }

}