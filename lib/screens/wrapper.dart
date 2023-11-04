import 'package:couple_list/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';
import '../providers/cluser_provider.dart';
import 'authenticate/sign_in.dart';
import 'couple_list.dart';

class Wrapper extends HookConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthService authService = AuthService();

    User? currentUser = authService.currentLogIn();
    ref.watch(clUserProvider);

    if (currentUser == null) {
      return const SignIn();
    }

    ref.read(clUserProvider.notifier).set(currentUser);

    return const CoupleList();
  }
}
