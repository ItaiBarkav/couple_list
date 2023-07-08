import 'package:flutter/material.dart';

import 'widgets/task.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

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
