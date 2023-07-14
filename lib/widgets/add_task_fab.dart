import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task.dart';
import '../providers/tasks_provider.dart';
import 'icecream_icon.dart';

class AddTaskFab extends ConsumerWidget {
  const AddTaskFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController taskTEC = TextEditingController();
    final TextEditingController costTEC = TextEditingController();

    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          title: const Center(
            child: Text('Add new task'),
          ),
          children: [
            TextField(
              controller: taskTEC,
              autofocus: true,
              decoration: const InputDecoration(
                labelText: 'Task',
                hintText: 'Enter a task',
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: costTEC,
                    decoration: const InputDecoration(
                      labelText: 'Score',
                      hintText: 'Enter task\'s score',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const IcecreamIcon(),
              ],
            ),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.yellow),
              ),
              onPressed: () {
                ref.read(tasksProvider.notifier).add(
                      Task(
                        createdBy: '',
                        task: taskTEC.text,
                        cost: int.parse(costTEC.text),
                        status: 'new',
                      ),
                    );
                taskTEC.clear();
                costTEC.clear();
                Navigator.pop(context);
              },
              child: const Text('Create'),
            ),
          ],
        ),
      ),
      child: const Icon(Icons.add, size: 32),
    );
  }
}
