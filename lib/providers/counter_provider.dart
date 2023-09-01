import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter_Provider extends _$Counter_Provider{

  @override
  int build(){
    return  0;
  }

  int increment()
  {
    return state++;
    // final counter = ref.read(counter_ProviderProvider.notifier);
    // counter.increment(key);
  }
  int  decrement()
  {
    return state--;
    // final counter = ref.read(counter_ProviderProvider.notifier);
    // counter.decrement(key);
  }

}