import 'package:flutter/material.dart';

class IcecreamIcon extends StatelessWidget {
  const IcecreamIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      image: AssetImage('assets/icons/icecream.png'),
      width: 40,
      height: 40,
    );
  }
}
