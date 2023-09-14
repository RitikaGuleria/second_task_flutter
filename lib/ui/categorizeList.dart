import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:convert';

import '../providers/providers.dart';

class MyCategories extends StatelessWidget {
  const MyCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Categorized List App',
      home: CategorizedListScreen(),
    );
  }
}

class CategorizedListScreen extends ConsumerStatefulWidget {
  const CategorizedListScreen({super.key});

  @override
  ConsumerState createState() => _CategorizedListScreenState();
}

class _CategorizedListScreenState extends ConsumerState<CategorizedListScreen> {
  late Future<List<Map<String, dynamic>>> _data;

  @override
  void initState() {
    super.initState();
    _data = ref.read(providersProvider.notifier).fetchDataForCategoriesList();
  }

  Map<int, List<Map<String, dynamic>>> categorizeData(
      List<Map<String, dynamic>> data) {

    final Map<int, List<Map<String, dynamic>>> categorizedData = {};

    for (final item in data) {
      final userId = item['userId'] as int;

      if (!categorizedData.containsKey(userId)) {
        categorizedData[userId] = [];
      }

      categorizedData[userId]!.add(item);
    }

    return categorizedData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorized List'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _data,
        builder: (context, snapshot) {

            final data = snapshot.data!;
            final categorizedData = categorizeData(data);

            return ListView.builder(
              itemCount: categorizedData.length,
              itemBuilder: (context, index) {
                final userId = categorizedData.keys.elementAt(index);
                final userPosts = categorizedData[userId]!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'User ID: $userId',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: userPosts.length,
                      itemBuilder: (context, itemIndex) {
                        final post = userPosts[itemIndex];
                        return Card(
                          child: ListTile(
                            title: Text(post['title']),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          }
      ),
    );
  }

  @override
  void dispose(){
    super.dispose();
    ref.invalidate(providersProvider);
  }
}
