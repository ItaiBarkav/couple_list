import 'package:flutter/material.dart';

import 'rewards_page.dart';
import 'tasks_page.dart';
import 'widgets/add_task_fab.dart';
import 'widgets/cl_app_bar.dart';

class CoupleList extends StatefulWidget {
  const CoupleList({Key? key}) : super(key: key);

  @override
  State<CoupleList> createState() => _CoupleListState();
}

class _CoupleListState extends State<CoupleList> {
  int currentPage = 0;
  List<Widget> pages = const [TasksPage(), RewardsPage()];

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: GestureDetector(
        onPanUpdate: pageUpdate,
        child: Scaffold(
          appBar: const ClAppBar(),
          body: pages[currentPage],
          floatingActionButton: const AddTaskFab(),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () => setState(() => currentPage = 0),
                    icon: const Icon(Icons.home_outlined),
                    iconSize: 42),
                IconButton(
                  onPressed: () => setState(() => currentPage = 1),
                  icon: const Icon(Icons.card_giftcard),
                  iconSize: 42,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pageUpdate(details) {
    if (details.delta.dx > 0) {
      setState(() => currentPage = 0);
    } else {
      setState(() => currentPage = 1);
    }
  }
}
