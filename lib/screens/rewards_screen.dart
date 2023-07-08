import 'package:flutter/material.dart';

import '../widgets/reward.dart';

class RewardsScreen extends StatefulWidget {
  const RewardsScreen({Key? key}) : super(key: key);

  @override
  State<RewardsScreen> createState() => _RewardsScreenState();
}

class _RewardsScreenState extends State<RewardsScreen> {
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
