import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  const RewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RewardsPage2();
  }
}

class RewardsPage2 extends StatefulWidget {
  const RewardsPage2({Key? key}) : super(key: key);

  @override
  State<RewardsPage2> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Title(color: Colors.blue, child: const Text('Rewards')),
          Expanded(
            child: ListView(
              children: [
                Card(
                  child: ListTile(
                    title: const Text('15 min massage'),
                    subtitle: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.yellow),
                      ),
                      onPressed: () => debugPrint('Get reward'),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('15 min massage'),
                    subtitle: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.yellow),
                      ),
                      onPressed: () => debugPrint('Get reward'),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    title: const Text('15 min massage'),
                    subtitle: ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.yellow),
                      ),
                      onPressed: () => debugPrint('Get reward'),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
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
