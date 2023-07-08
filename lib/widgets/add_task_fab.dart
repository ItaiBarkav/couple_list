import 'package:flutter/material.dart';

import 'icecream_icon.dart';

class AddTaskFab extends StatefulWidget {
  const AddTaskFab({Key? key}) : super(key: key);

  @override
  State<AddTaskFab> createState() => _AddTaskFabState();
}

class _AddTaskFabState extends State<AddTaskFab> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          title: const Center(
            child: Text('Add new task'),
          ),
          children: [
            const TextField(
              decoration:
                  InputDecoration(labelText: 'Task', hintText: 'Enter a task'),
            ),
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: 'Score', hintText: 'Enter task\'s score'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                IcecreamIcon(),
              ],
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                ),
                onPressed: () => debugPrint('Create completed'),
                child: const Text('Create')),
          ],
        ),
      ),
      child: const Icon(Icons.add, size: 32),
    );
  }
}
