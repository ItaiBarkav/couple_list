import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_reward_provider.g.dart';

@riverpod
class NewReward extends _$NewReward {
  @override
  bool build() => false;

  void update(bool status) => state = status;
}
