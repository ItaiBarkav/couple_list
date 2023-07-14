import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'icecream_icon.dart';
import '../models/task.dart';

class Reward extends HookConsumerWidget {
  const Reward({super.key, required this.reward});

  final Task reward;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(reward.task),
        subtitle: ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.yellow),
          ),
          onPressed: () => debugPrint('Get reward'),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const IcecreamIcon(),
              Text(reward.cost.toString()),
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
