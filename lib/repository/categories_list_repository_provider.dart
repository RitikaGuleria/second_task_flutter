import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:second_task_flutter/di/dioClientProvider.dart';
import 'package:second_task_flutter/repository/categories_list_repository.dart';

part 'categories_list_repository_provider.g.dart';

@riverpod
UserListRepository userListRepository(UserListRepositoryRef ref) => UserListRepository(
    client: ref.watch(dioProvider));