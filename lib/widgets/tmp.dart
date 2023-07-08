import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'icecream_icon.dart';

class Reward extends StatefulWidget {
  const Reward({Key? key}) : super(key: key);

  @override
  State<Reward> createState() => _RewardState();
}

List<Widget> bodyElements = [Container()];

class _RewardState extends State<Reward> with TickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    debugPrint('inti!!!!!!!');
    _animationController = AnimationController(vsync: this);

    // _animationController.addStatusListener((status) async {
    //   debugPrint('adasdsad');
    //   if (status == AnimationStatus.completed) {
    //     Navigator.pop(context);
    //     _animationController.reset();
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('15 min massage'),
        subtitle: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.yellow),
            ),
            onPressed: () {
              setState(() {
                bodyElements = [];
                bodyElements.add(Container(
                  child: Lottie.asset('assets/animations/completed.json',
                      controller: _animationController, onLoaded: (p0) {
                    debugPrint(p0.duration.toString());
                    _animationController.duration = p0.duration;
                    _animationController.forward();
                  }),
                ));
              });
            },
            child: bodyElements[0]),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

// class Reward extends StatelessWidget {
//   const Reward({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: const Text('15 min massage'),
//         subtitle: ElevatedButton(
//           style: const ButtonStyle(
//             backgroundColor: MaterialStatePropertyAll(Colors.yellow),
//           ),
//           onPressed: () => Expanded(
//               child: Lottie.asset('assets/animations/completed.json',),),
//           child: const Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IcecreamIcon(),
//               Text('20'),
//             ],
//           ),
//         ),
//         shape: const RoundedRectangleBorder(
//           side: BorderSide(color: Colors.black, width: 1),
//           borderRadius: BorderRadius.all(Radius.circular(10)),
//         ),
//       ),
//     );
//   }
// }
