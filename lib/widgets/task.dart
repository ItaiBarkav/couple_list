import 'package:flutter/material.dart';

import 'icecream_icon.dart';

class Task extends StatelessWidget {
  const Task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                IcecreamIcon(),
                Text('20'),
              ],
            ),
            children: [
              const Text('Clean the dishes'),
              ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.yellow),
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
            IcecreamIcon(),
            Text('20'),
          ],
        ),
      ),
    );
  }
}
