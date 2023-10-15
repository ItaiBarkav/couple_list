import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/task.dart';

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

  void remove(Task reward) {
    state.remove(reward);
    state = [...state];
  }
}
