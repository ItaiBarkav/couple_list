import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';

part 'partner_provider.g.dart';

@Riverpod(keepAlive: true)
class Partner extends _$Partner {
  @override
  User? build() {
    return null;
  }

  void set(User? user) {
    state = user;
  }
}
