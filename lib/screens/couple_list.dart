import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '/services/db.dart';
import '../models/user.dart';
import '../providers/cluser_provider.dart';
import '../providers/new_reward_provider.dart';
import '../providers/partner_provider.dart';
import '../providers/task_completed_provider.dart';
import '../providers/users_provider.dart';
import '../widgets/add_task_fab.dart';
import '../widgets/cl_app_bar.dart';
import '../widgets/cl_bottom_app_bar.dart';
import 'archive_screen.dart';
import 'rewards_screen.dart';
import 'tasks_screen.dart';

class CoupleList extends StatefulHookConsumerWidget {
  const CoupleList({super.key});

  @override
  ConsumerState<CoupleList> createState() => _CoupleListState();
}

class _CoupleListState extends ConsumerState<CoupleList> {
  final PageController _pageController = PageController(initialPage: 1);
  final DbService _dbService = DbService();

  User? _partner;
  bool _havePartner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ClAppBar(
        title: 'Hi ${ref.watch(clUserProvider).value!.displayName}',
      ),
      body: AnimatedContainer(
          duration: const Duration(seconds: 2),
          width: ref.watch(taskCompletedProvider) ? 600 : double.maxFinite,
          height: ref.watch(taskCompletedProvider) ? 600 : double.maxFinite,
          onEnd: () => ref.watch(taskCompletedProvider.notifier).update(false),
          child: ref.watch(taskCompletedProvider)
              ? Lottie.asset('assets/animations/completed.json')
              : _havePartner
                  ? PageView(
                      controller: _pageController,
                      onPageChanged: (page) {
                        if (page == 1) {
                          ref.read(newRewardProvider.notifier).update(false);
                        }
                      },
                      children: const [
                        ArchiveScreen(),
                        TasksScreen(),
                        RewardsScreen(),
                      ],
                    )
                  : FutureBuilder(
                      future: _setPartner(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return snapshot.data!;
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        }

                        return snapshot.data!;
                      },
                    )),
      floatingActionButton: const AddTaskFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClBottomAppBar(pageController: _pageController),
    );
  }

  @override
  void dispose() {
    super.dispose();

    _pageController.dispose();
  }

  Widget _choosePartner(List<User> users, User clUser) {
    return SimpleDialog(
      title: const Text('Choose partner'),
      children: [
        DropdownButton<User>(
          value: _partner,
          hint: const Text('Select partner'),
          items: users
              .map<DropdownMenuItem<User>>(
                (user) => DropdownMenuItem<User>(
                  value: user,
                  child: Text('${user.displayName} (${user.email})'),
                ),
              )
              .toList(),
          onChanged: (user) {
            setState(() => _partner = user);
          },
        ),
        ElevatedButton(
          child: const Text('Select'),
          onPressed: () async {
            ref.read(partnerProvider.notifier).set(_partner);
            _dbService.addCouple(clUser, _partner!);
            setState(
              () => _havePartner = true,
            );
          },
        )
      ],
    );
  }

  Future<Widget?> _setPartner() async {
    List<User> users = ref.watch(usersProvider);
    User? clUser = ref.watch(clUserProvider).value;

    return await _dbService.haveCouple(clUser!).then(
      (partner) {
        if (partner == null) {
          return _choosePartner(users, clUser);
        }

        ref.read(partnerProvider.notifier).set(partner);
        setState(
          () => _havePartner = true,
        );

        return null;
      },
    );
  }
}
