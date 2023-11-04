import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/task.dart' as model;
import '../providers/archive_provider.dart';
import '../widgets/task.dart';

class ArchiveScreen extends HookConsumerWidget {
  const ArchiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<model.Task>? tasks = ref.watch(archiveProvider).value;

    return Column(
      children: [
        const Text('Archive'),
        Expanded(
          child: ListView(
            children: tasks == null
                ? []
                : tasks
                    .map(
                      (task) => Task(
                        task: task,
                        disable: true,
                      ),
                    )
                    .toList(),
          ),
        ),
      ],
    );
  }
}
