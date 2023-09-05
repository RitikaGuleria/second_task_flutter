import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:second_task_flutter/model/categoriesnames.dart';
import 'package:second_task_flutter/providers/providers.dart';
import 'package:second_task_flutter/providers/Search.dart';
import 'package:second_task_flutter/providers/counter_provider.dart';

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
      ref.read(providersProvider.notifier).fetchCategories();
    });
  }

  @override
  Widget build(BuildContext context) {

    final apiProvider = ref.watch(providersProvider);
    final itemToSearch=ref.watch(searchProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Food Category List"),
      ),
      body:
          // Consumer(builder: (context, ref, child) {
          //   AsyncValue<List<CategoriesNames>> cl = ref.watch(aPIService_ProviderProvider);
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SafeArea(child: TextFormField(
              validator: (val){
                if(val==null || val.isEmpty){
                  return "Please enter something to search";
                }
                return null;
              },
              onChanged: (value){
                ref.watch(searchProvider.notifier).update(value);
              },
              onEditingComplete: (){
                ref.watch(providersProvider.notifier).searchAndUpdateNewList(itemToSearch);
              },
              decoration: InputDecoration(
                hintText: "Search",border: OutlineInputBorder(borderRadius: BorderRadius.circular(22))
              ),
            )),

            SizedBox(height: 12,),

            Expanded(
              child: apiProvider.when(
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
                                          ref
                                              .watch(
                                              providersProvider.notifier)
                                              .decrease(index);
                                        },
                                        icon: const Icon(Icons.remove)),
                                    Text(item.count.toString()),
                                    IconButton(
                                        onPressed: () {
                                          // final countVal= index+1;
                                          // ref.watch(IncrementcProvider(count: 0));
                                          ref
                                              .watch(
                                              providersProvider.notifier)
                                              .increase(index);
                                        },
                                        icon: const Icon(Icons.add)),
                                    IconButton(
                                        onPressed: () {
                                          // setState(() {
                                          //   categoryData.removeAt(index);
                                          // });

                                          ref
                                              .read(providersProvider
                                              .notifier)
                                              .deleteTile(index);
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
                  loading: () => Center(child: CircularProgressIndicator())
              ),
            ),
          ],
        ),
      )

    );
    }
}