import 'package:flutter/material.dart';

import 'widgets/reward.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({Key? key}) : super(key: key);

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Title(color: Colors.blue, child: const Text('Rewards')),
          Expanded(
            child: ListView(
              children: const [
                Reward(),
                Reward(),
                Reward(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
