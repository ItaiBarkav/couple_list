import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
class ClUser extends _$ClUser {
  @override
  User? build() {
    return null;
  }

  void set(User? user) {
    state = user;
  }
}
