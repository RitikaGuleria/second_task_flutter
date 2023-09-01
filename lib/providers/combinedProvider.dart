import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:second_task_flutter/model/categoriesnames.dart';
import 'package:second_task_flutter/providers/APIService_Provider.dart';
import 'package:second_task_flutter/providers/remove_tile_provider.dart';

part 'combinedProvider.g.dart';

@riverpod
class combinedProvider extends _$combinedProvider{

  @override
  List<CategoriesNames>  build() {
    return [];
  }

  AsyncValue<List<CategoriesNames>> combined(APIService_Provider al,RemoveTileProvider rl){
    final apiList = ref.watch(aPIService_ProviderProvider);
    final deletedItem= ref.watch(removeTileProviderProvider.notifier);

    return apiList.whenData((apiListData) => apiListData.where((element) => !deletedItem.state.contains(element)).toList());
  }

}