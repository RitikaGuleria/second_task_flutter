import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List _dataDummy = [
  {
    "albumId": 1,
    "id": 1,
    "title": "Flutter",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952",
    "author": "Hanth",
    "date": "9/12/23",
    "group": "Flutter"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "Dart",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "https://via.placeholder.com/150/771796",
    "author": "Johan Jurris",
    "date": "9/12/23",
    "group": "Flutter"
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "Android",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "https://via.placeholder.com/150/24f355",
    "author": "Me",
    "date": "7/12/23",
    "group": "Android"
  },
  {
    "albumId": 1,
    "id": 4,
    "title": "Java",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "https://via.placeholder.com/150/d32776",
    "author": "Me",
    "date": "6/12/23",
    "group": "Java"
  },
  {
    "albumId": 1,
    "id": 5,
    "title": "Kotlin",
    "url": "https://via.placeholder.com/600/f66b97",
    "thumbnailUrl": "https://via.placeholder.com/150/f66b97",
    "author": "Me",
    "date": "7/12/23",
    "group": "Android"
  },
  {
    "albumId": 1,
    "id": 6,
    "title": "Jetpack Compose",
    "url": "https://via.placeholder.com/600/56a8c2",
    "thumbnailUrl": "https://via.placeholder.com/150/56a8c2",
    "author": "Phillip",
    "date": "7/12/23",
    "group": "Android"
  },
];

class GroupedListPackage extends StatefulWidget {
  const GroupedListPackage({super.key});

  @override
  State<GroupedListPackage> createState() => _GroupedListPackageState();
}

class _GroupedListPackageState extends State<GroupedListPackage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grouped List"),
      ),
      body: GroupedListView<dynamic, String>(
        elements: _dataDummy,
        groupBy: (element) => element['group'],
        groupSeparatorBuilder: (String groupByValue) => Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Flexible(
                  child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      groupByValue,
                      textAlign: TextAlign.start,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        itemBuilder: (context, dynamic element) {
          return Card(
            elevation: 10,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: ClipRect(
                      child: Image(
                        image: NetworkImage(element['thumbnailUrl']),
                        fit: BoxFit.cover,
                      ),
                      // borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  Expanded(
                      flex: 5,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                element['title'],
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w200),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
          );
        },
        itemComparator: (item1, item2) =>
            item1['title'].compareTo(item2['title']),
        useStickyGroupSeparators: true,
        floatingHeader: true,
        order: GroupedListOrder.ASC,
      ),
    );
  }
}
