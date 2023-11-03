import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/task.dart';
import '../models/user.dart';
import '../services/db.dart';
import 'cluser_provider.dart';
import 'partner_provider.dart';

part 'tasks_provider.g.dart';

@riverpod
class Tasks extends _$Tasks {
  static DbService dbService = DbService();

  @override
  Stream<List<Task>> build() {
    User? partner = _getPartner();

    if (partner == null) {
      return const Stream.empty();
    }

    return dbService.getTasks(partner);
  }

  void remove(Task task) {
    User? user = ref.watch(clUserProvider).value;

    dbService.completeTask(user!, _getPartner()!, task);
  }

  User? _getPartner() {
    return ref.watch(partnerProvider.select((partner) => partner.value));
  }
}
