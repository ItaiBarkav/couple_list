import 'package:flutter/material.dart';

import 'icecream_icon.dart';

class ClAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ClAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('CoupleList'),
          Row(
            children: [
              IcecreamIcon(),
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
