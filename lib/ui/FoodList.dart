import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_task_flutter/model/categoriesnames.dart';
import 'package:second_task_flutter/providers/APIService_Provider.dart';
import 'package:second_task_flutter/providers/counter_provider.dart';
import 'package:second_task_flutter/providers/remove_tile_provider.dart';




class FoodList extends ConsumerStatefulWidget {
  const FoodList({super.key});

  @override
  ConsumerState<FoodList> createState() => _FoodListState();
}

class _FoodListState extends ConsumerState<FoodList> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(aPIService_ProviderProvider.notifier).fetchCategories();

    });

  }

  @override
  Widget build(BuildContext context) {
    final counter = ref.watch(counter_ProviderProvider);
    // final removeTile = ref.watch(removeTileProviderProvider);


    //To access previous and current value, you can use listen
    ref.listen<int>(counter_ProviderProvider, (previous, next) {
      print('previous : $previous | current value : $next');
    }, onError: (error, stackTrace) {});


    return Scaffold(
      appBar: AppBar(
        title: Text("Food Category List"),
      ),
      body: Consumer(builder: (context, ref, child) {

        AsyncValue<List<CategoriesNames>> cl = ref.watch(aPIService_ProviderProvider);

        return cl.when(
            data: (categoryData) {
              return ListView.builder(
                  itemCount: categoryData.length,
                  itemBuilder: (context, index) {
                    final item = categoryData[index];
                    return Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22)),
                        child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Image.network(
                            item.strCategoryThumb,
                            fit: BoxFit.fill,
                            height: 45,
                            width: 45,
                          ),
                        ),
                        title: Text(item.strCategory),
                        trailing: FittedBox(
                          child: Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    ref.watch(counter_ProviderProvider.notifier).decrement();
                                  },
                                  icon: const Icon(Icons.remove)),
                              Text(counter.toString()),
                              IconButton(
                                  onPressed: () {
                                    ref.watch(counter_ProviderProvider.notifier).increment();
                                  },
                                  icon: const Icon(Icons.add)),
                              IconButton(
                                  onPressed: () {

                                    // setState(() {
                                    //   categoryData.removeAt(index);
                                    // });

                                   ref.read(aPIService_ProviderProvider.notifier).deleteTile(index);
                                  },
                                  icon: const Icon(Icons.delete))
                            ],
                          ),
                        ),
                        // subtitle: Text(),
                      ),
                    );
                  });
            },
            error: (err, stack) => Text("Error is: $err"),
            loading: () => Center(child: CircularProgressIndicator()));
      }),
    );
  }

}


