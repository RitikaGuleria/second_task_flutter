import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:second_task_flutter/ui/FoodList.dart';
import 'package:second_task_flutter/ui/categorizeList.dart';
import 'package:second_task_flutter/ui/groupedList.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyCategories(),
    );
  }
}
