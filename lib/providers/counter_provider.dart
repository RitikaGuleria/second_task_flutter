import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:second_task_flutter/model/categoriesnames.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter_Provider extends _$Counter_Provider {
  @override
  int build() {
    return 0;
  }

  int increment(int index) {

    return state++;
    // }
    // return state;
  }

  int decrement(int index) {
    if (state > 0) {
      state--;
    }
    return state;
  }
}
