import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/task.dart';

part 'tasks_provider.g.dart';

@Riverpod(keepAlive: true)
class Tasks extends _$Tasks {
  @override
  List<Task> build() {
    return [];
  }

  void add(Task task) {
    state.add(task);
    state = [...state];
  }

  void remove(Task task) {
    state.remove(task);
    state = [...state];
  }
}
