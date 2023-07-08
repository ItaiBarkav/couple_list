import 'package:flutter/material.dart';

import 'icecream_icon.dart';

class Reward extends StatelessWidget {
  const Reward({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('15 min massage'),
        subtitle: ElevatedButton(
          style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.yellow),
          ),
          onPressed: () => debugPrint('Get reward'),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IcecreamIcon(),
              Text('20'),
            ],
          ),
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}
