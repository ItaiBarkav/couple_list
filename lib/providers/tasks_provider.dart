import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/task.dart';

class TasksListNotifier extends StateNotifier<List<Task>> {
  TasksListNotifier() : super([]);

  void add(Task task) {
    state.add(task);
    state = [...state];
  }

  void remove(Task task) {
    state.remove(task);
    state = [...state];
  }
}

final tasksProvider = StateNotifierProvider<TasksListNotifier, List<Task>>(
  (ref) => TasksListNotifier(),
);
