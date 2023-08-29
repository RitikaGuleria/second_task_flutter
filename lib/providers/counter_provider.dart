import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter_Provider extends _$Counter_Provider{

  @override
  int build(){
    return 0;
  }

  void increment()
  {
    state++;
  }
  void decrement()
  {
    state--;
  }

}