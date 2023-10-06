import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/user.dart';
import '../providers/user_provider.dart';
import 'authenticate/sign_in.dart';
import 'couple_list.dart';

class Wrapper extends HookConsumerWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    User? user = ref.watch(clUserProvider);

    if (user == null) {
      return const SignIn();
    }

    return const CoupleList();
  }
}
