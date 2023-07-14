import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/new_reward_provider.dart';
import 'rewards_screen.dart';
import 'tasks_screen.dart';
import '../widgets/add_task_fab.dart';
import '../widgets/cl_app_bar.dart';
import '../widgets/cl_bottom_app_bar.dart';

class CoupleList extends StatefulHookConsumerWidget {
  const CoupleList({Key? key}) : super(key: key);

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
    return Scaffold(
      appBar: const ClAppBar(),
      body: PageView(
        controller: pageController,
        onPageChanged: (page) {
          if (page == 1) {
            ref.read(newRewardProvider.notifier).update(false);
          }
        },
        children: const [TasksScreen(), RewardsScreen()],
      ),
      floatingActionButton: const AddTaskFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClBottomAppBar(pageController: pageController),
    );
  }
}
