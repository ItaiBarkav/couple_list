import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/new_reward_provider.dart';
import '../providers/rewards_provider.dart';
import '../providers/tasks_provider.dart';
import 'icecream_icon.dart';
import '../models/task.dart' as model;

class Task extends HookConsumerWidget {
  const Task({super.key, required this.task});

  final model.Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 1),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        onTap: () => showDialog(
          context: context,
          builder: (context) => SimpleDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const IcecreamIcon(),
                Text(task.cost.toString()),
              ],
            ),
            children: [
              Text(task.task),
              ElevatedButton(
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.yellow),
                ),
                onPressed: () {
                  ref.read(tasksProvider.notifier).remove(task);
                  ref.read(rewardsProvider.notifier).add(task);
                  ref.read(newRewardProvider.notifier).update(true);
                  Navigator.pop(context);
                },
                child: const Text('Complete'),
              ),
            ],
          ),
        ),
        title: Text(task.task),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const IcecreamIcon(),
            Text(task.cost.toString()),
          ],
        ),
      ),
    );
  }
}
