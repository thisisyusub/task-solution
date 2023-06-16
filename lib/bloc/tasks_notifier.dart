import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/task.dart';
import '../service/network_service.dart';

/// we can use 2 ways

// 1. using FutureProvider (I will use it because it is simple case)

final tasksProvider = FutureProvider.autoDispose<List<Task>>((ref) async {
  final tasks = await ref.watch(networkServiceProvider).getTasks();
  return tasks;
});


// 2. we can create a class that extends StateNotifier and use it as a provider