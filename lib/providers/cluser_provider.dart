import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';

part 'cluser_provider.g.dart';

@riverpod
class ClUser extends _$ClUser {
  @override
  User? build() {
    return null;
  }

  void set(User? user) {
    state = user;
  }
}
