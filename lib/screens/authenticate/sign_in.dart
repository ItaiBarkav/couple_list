import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/user.dart';
import '../../providers/user_provider.dart';
import '../../services/auth.dart';
import '../../services/db.dart';
import '../../widgets/cl_app_bar.dart';

class SignIn extends HookConsumerWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AuthService auth = AuthService();
    final DbService db = DbService();

    return Scaffold(
      appBar: const ClAppBar(showScore: true),
      body: Column(
        children: [
          const Text('Sign In'),
          FloatingActionButton.large(
            child: const Image(
              image: AssetImage('assets/icons/google-logo.png'),
              width: 80,
              height: 80,
            ),
            onPressed: () async {
              User? user = await auth.signInWithGoogle();
              if (user == null) {
                debugPrint('error signing in');
              } else {
                ref.read(clUserProvider.notifier).set(user);
                db.addUser(user);
              }
            },
          )
        ],
      ),
    );
  }
}
