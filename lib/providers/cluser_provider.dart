import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';
import '../services/db.dart';

part 'cluser_provider.g.dart';

@riverpod
class ClUser extends _$ClUser {
  final DbService _dbService = DbService();

  @override
  Stream<User> build() {
    return const Stream.empty();
  }

  void set(User? user) {
    _dbService.getUser(user!).listen(
          (userFromDb) => state = AsyncValue.data(userFromDb),
        );
  }
}
