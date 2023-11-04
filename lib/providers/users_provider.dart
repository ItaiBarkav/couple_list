import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';
import '../services/db.dart';
import 'cluser_provider.dart';

part 'users_provider.g.dart';

@riverpod
class Users extends _$Users {
  final DbService _dbService = DbService();

  @override
  Future<List<User>> build() async {
    User? user = ref.watch(clUserProvider).value;

    if (user == null) {
      return [];
    }

    return await _dbService.getUsers(user).then(
          (users) => users,
        );
  }

  void set(List<User> users) {
    state = AsyncData([...users]);
  }
}
