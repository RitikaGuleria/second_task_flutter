
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'Search.g.dart';

@riverpod
class Search extends _$Search{

  @override
  String build(){
    return '';
  }

  String update(String value)
  {
    state= value;
    return state;
  }
}