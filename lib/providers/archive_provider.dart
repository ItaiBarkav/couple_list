import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/task.dart';
import '../models/user.dart';
import '../services/db.dart';
import 'cluser_provider.dart';

part 'archive_provider.g.dart';

@riverpod
class Archive extends _$Archive {
  static DbService dbService = DbService();

  @override
  Stream<List<Task>> build() {
    User? user = ref.watch(clUserProvider).value;

    if (user == null) {
      return const Stream.empty();
    }

    return dbService.getTasks(user);
  }
}
