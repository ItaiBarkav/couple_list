import 'package:flutter/material.dart';

import '../widgets/task.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Title(color: Colors.blue, child: const Text('Daily Tasks')),
          Expanded(
            child: ListView(
              children: const [
                Task(),
                Task(),
                Task(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
