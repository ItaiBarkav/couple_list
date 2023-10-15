import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/user.dart';

part 'users_provider.g.dart';

@Riverpod(keepAlive: true)
class Users extends _$Users {
  @override
  List<User> build() {
    return [];
  }

  void add(User user) {
    state.add(user);
    state = [...state];
  }

  void set(List<User> users) {
    state = [...users];
  }
}
