import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/task.dart';
import '../models/user.dart';
import '../services/db.dart';
import 'partner_provider.dart';

part 'tasks_provider.g.dart';

@riverpod
class Tasks extends _$Tasks {
  static DbService dbService = DbService();

  @override
  Stream<List<Task>> build() {
    User? partner = ref.watch(partnerProvider);

    if (partner == null) {
      return const Stream.empty();
    }

    return dbService.getTasks(partner);
  }

  void remove(Task task) {
    User? partner = ref.watch(partnerProvider);

    dbService.removeTask(partner!, task);
  }
}
