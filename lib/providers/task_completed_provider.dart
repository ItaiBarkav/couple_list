import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'task_completed_provider.g.dart';

@riverpod
class TaskCompleted extends _$TaskCompleted {
  @override
  bool build() => false;

  void update(bool status) => state = status;
}
