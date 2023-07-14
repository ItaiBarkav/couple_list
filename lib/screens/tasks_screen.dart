import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/tasks_provider.dart';
import '../widgets/task.dart';
import '../models/task.dart' as model;

class TasksScreen extends HookConsumerWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<model.Task> tasks = ref.watch(tasksProvider);

    return Column(
      children: [
        const Text('Daily tasks'),
        Expanded(
          child: ListView(
            children: tasks.map((task) => Task(task: task)).toList(),
          ),
        ),
      ],
    );
  }
}
