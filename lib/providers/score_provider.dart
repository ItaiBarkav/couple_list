import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';
import '../services/db.dart';
import 'cluser_provider.dart';

part 'score_provider.g.dart';

@riverpod
class Score extends _$Score {
  static DbService dbService = DbService();

  @override
  Stream<int> build() {
    User? user = ref.watch(clUserProvider);

    if (user == null) {
      return Stream.value(0);
    }

    return dbService.getScore(user);
  }
}
