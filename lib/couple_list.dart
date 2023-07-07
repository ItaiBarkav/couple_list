import 'package:couple_list/tasks_page.dart';
import 'package:couple_list/rewards_page.dart';
import 'package:flutter/material.dart';

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
          appBar: AppBar(
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('CoupleList'),
                Row(
                  children: [
                    Image(
                      image: AssetImage('assets/icons/icecream.png'),
                      width: 40,
                      height: 40,
                    ),
                    Text('20'),
                  ],
                )
              ],
            ),
            backgroundColor: Colors.yellow,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(32),
              ),
            ),
          ),
          body: pages[currentPage],
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () => showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                title: const Center(
                  child: Text('Add new task'),
                ),
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        labelText: 'Task', hintText: 'Enter a task'),
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Score',
                              hintText: 'Enter task\'s score'),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/icons/icecream.png'),
                        width: 40,
                        height: 40,
                      ),
                    ],
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.yellow),
                      ),
                      onPressed: () => debugPrint('Create completed'),
                      child: const Text('Create')),
                ],
              ),
            ),
            child: const Icon(Icons.add, size: 32),
          ),
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
      setState(() {
        currentPage = 0;
      });
    }

    if (details.delta.dx < 0) {
      setState(() {
        currentPage = 1;
      });
    }
  }
}
