import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/rewards_provider.dart';
import '../widgets/reward.dart';
import '../models/task.dart' as model;

class RewardsScreen extends HookConsumerWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<model.Task> rewards = ref.watch(rewardsProvider);

    return Column(
      children: [
        const Text('Rewards'),
        Expanded(
          child: ListView(
            children: rewards.map((reward) => Reward(reward: reward)).toList(),
          ),
        ),
      ],
    );
  }
}
