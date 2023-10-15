import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/rewards_provider.dart';
import 'icecream_icon.dart';

class ClAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  final bool showScore;
  final String title;

  const ClAppBar({super.key, this.showScore = true, this.title = 'CoupleList'});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int sum =
        ref.watch(rewardsProvider).fold(0, (sum, item) => sum + item.cost);

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          showScore
              ? Row(
                  children: [
                    const IcecreamIcon(),
                    Text('$sum'),
                  ],
                )
              : Container()
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
