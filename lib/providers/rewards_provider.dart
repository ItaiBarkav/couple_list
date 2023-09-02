import 'package:couple_list/models/task.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rewards_provider.g.dart';

@Riverpod(keepAlive: true)
class Rewards extends _$Rewards {
  @override
  List<Task> build() {
    return [];
  }

  void add(Task reward) {
    state.add(reward);
    state = [...state];
  }
}

// import 'package:hooks_riverpod/hooks_riverpod.dart';

// import '../models/task.dart';

// class RewardListNotifier extends StateNotifier<List<Task>> {
//   RewardListNotifier() : super([]);

//   void add(Task reward) {
//     state.add(reward);
//     state = [...state];
//   }
// }

// final rewardsProvider = StateNotifierProvider<RewardListNotifier, List<Task>>(
//   (ref) => RewardListNotifier(),
// );
