import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Title(color: Colors.blue, child: const Text('Daily Tasks')),
          Expanded(
            child: ListView(
              children: [
                Card(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: AssetImage('assets/icons/icecream.png'),
                              width: 40,
                              height: 40,
                            ),
                            Text('20'),
                          ],
                        ),
                        children: [
                          const Text('Clean the dishes'),
                          ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.yellow),
                              ),
                              onPressed: () => debugPrint('Task completed'),
                              child: const Text('Complete')),
                        ],
                      ),
                    ),
                    title: const Text('Clean the dishes'),
                    trailing: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage('assets/icons/icecream.png'),
                          width: 40,
                          height: 40,
                        ),
                        Text('20'),
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: AssetImage('assets/icons/icecream.png'),
                              width: 40,
                              height: 40,
                            ),
                            Text('20'),
                          ],
                        ),
                        children: [
                          const Text('Clean the dishes'),
                          ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.yellow),
                              ),
                              onPressed: () => debugPrint('Task completed'),
                              child: const Text('Complete')),
                        ],
                      ),
                    ),
                    title: const Text('Clean the dishes'),
                    trailing: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage('assets/icons/icecream.png'),
                          width: 40,
                          height: 40,
                        ),
                        Text('20'),
                      ],
                    ),
                  ),
                ),
                Card(
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: ListTile(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => SimpleDialog(
                        title: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image(
                              image: AssetImage('assets/icons/icecream.png'),
                              width: 40,
                              height: 40,
                            ),
                            Text('20'),
                          ],
                        ),
                        children: [
                          const Text('Clean the dishes'),
                          ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.yellow),
                              ),
                              onPressed: () => debugPrint('Task completed'),
                              child: const Text('Complete')),
                        ],
                      ),
                    ),
                    title: const Text('Clean the dishes'),
                    trailing: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image(
                          image: AssetImage('assets/icons/icecream.png'),
                          width: 40,
                          height: 40,
                        ),
                        Text('20'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
