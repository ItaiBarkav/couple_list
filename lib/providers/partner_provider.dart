import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';
import '../services/db.dart';
import 'cluser_provider.dart';

part 'partner_provider.g.dart';

@riverpod
class Partner extends _$Partner {
  final DbService _dbService = DbService();

  @override
  Future<User?> build() async {
    User? user = ref.watch(clUserProvider).value;

    if (user == null) {
      return null;
    }

    return await _dbService.haveCouple(user).then(
          (partner) => partner,
        );
  }

  void set(User? partner) {
    state = AsyncData(partner);
  }
}
