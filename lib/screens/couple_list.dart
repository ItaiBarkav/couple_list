import 'package:flutter/material.dart';

import 'rewards_screen.dart';
import 'tasks_screen.dart';
import '../widgets/add_task_fab.dart';
import '../widgets/cl_app_bar.dart';
import '../widgets/cl_bottom_app_bar.dart';

class CoupleList extends StatefulWidget {
  const CoupleList({Key? key}) : super(key: key);

  @override
  State<CoupleList> createState() => _CoupleListState();
}

class _CoupleListState extends State<CoupleList> {
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
        children: const [TasksScreen(), RewardsScreen()],
      ),
      floatingActionButton: const AddTaskFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: ClBottomAppBar(pageController: pageController),
    );
  }
}
