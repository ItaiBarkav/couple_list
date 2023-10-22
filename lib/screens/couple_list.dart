import '../providers/tasks_provider.dart';
import '/services/db.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../models/user.dart';
import '../providers/cluser_provider.dart';
import '../providers/new_reward_provider.dart';
import '../providers/partner_provider.dart';
import '../providers/task_completed_provider.dart';
import '../providers/users_provider.dart';
import 'rewards_screen.dart';
import 'tasks_screen.dart';
import '../widgets/add_task_fab.dart';
import '../widgets/cl_app_bar.dart';
import '../widgets/cl_bottom_app_bar.dart';

class CoupleList extends StatefulHookConsumerWidget {
  const CoupleList({super.key});

  @override
  ConsumerState<CoupleList> createState() => _CoupleListState();
}

class _CoupleListState extends ConsumerState<CoupleList> {
  final pageController = PageController();

  @override
  void dispose() {
    super.dispose();

    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<User> users = ref.watch(usersProvider);

    _choosePartner(users);

    return Scaffold(
      appBar: ClAppBar(
        title: 'Hi ${ref.watch(clUserProvider)!.displayName}',
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        width: ref.watch(taskCompletedProvider) ? 600 : double.maxFinite,
        height: ref.watch(taskCompletedProvider) ? 600 : double.maxFinite,
        onEnd: () => ref.watch(taskCompletedProvider.notifier).update(false),
        child: ref.watch(taskCompletedProvider)
            ? Lottie.asset('assets/animations/completed.json')
            : PageView(
                controller: pageController,
                onPageChanged: (page) {
                  if (page == 1) {
                    ref.read(newRewardProvider.notifier).update(false);
                  }
                },
                children: const [
                  TasksScreen(),
                  RewardsScreen(),
                ],
              ),
      ),
      floatingActionButton: const AddTaskFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClBottomAppBar(pageController: pageController),
    );
  }

  void _choosePartner(List<User> users) {
    User? clUser = ref.watch(clUserProvider);
    User? partner = users.first;
    DbService dbService = DbService();

    if (ref.watch(partnerProvider) == null) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => showDialog(
          context: context,
          builder: (_) => SimpleDialog(
            title: const Text('Choose partner'),
            children: [
              DropdownButton(
                value: partner,
                items: users.map<DropdownMenuItem<User>>(
                  (user) {
                    return DropdownMenuItem<User>(
                      value: user,
                      child: Text("${user.displayName} (${user.email})"),
                    );
                  },
                ).toList(),
                onChanged: (user) {
                  partner = user;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  ref.read(partnerProvider.notifier).set(partner);
                  dbService.addCouple(clUser!, partner!);
                  ref.read(tasksProvider.notifier).set(
                        await dbService.getTasks(partner!),
                      );

                  if (!mounted) {
                    return;
                  }

                  Navigator.pop(context);
                },
                child: const Text('Select'),
              )
            ],
          ),
        ),
      );
    }
  }
}
