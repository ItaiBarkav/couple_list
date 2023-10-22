import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/task.dart';
import '../models/user.dart';
import '../providers/cluser_provider.dart';
import '../services/db.dart';
import 'icecream_icon.dart';

class AddTaskFab extends ConsumerWidget {
  const AddTaskFab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController taskTEC = TextEditingController();
    final TextEditingController costTEC = TextEditingController();
    final DbService dbService = DbService();
    User? user = ref.watch(clUserProvider);

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
                Task task = Task(
                  id: const Uuid().v4(),
                  task: taskTEC.text,
                  cost: int.parse(costTEC.text),
                );
                dbService.addTask(user!, task);
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
