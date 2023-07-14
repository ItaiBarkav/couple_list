import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/task.dart';

class RewardListNotifier extends StateNotifier<List<Task>> {
  RewardListNotifier() : super([]);

  void add(Task reward) {
    state.add(reward);
    state = [...state];
  }
}

final rewardsProvider = StateNotifierProvider<RewardListNotifier, List<Task>>(
  (ref) => RewardListNotifier(),
);
