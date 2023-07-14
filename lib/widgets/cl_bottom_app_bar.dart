import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../providers/new_reward_provider.dart';

class ClBottomAppBar extends HookConsumerWidget {
  const ClBottomAppBar({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () => pageController.animateToPage(0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear),
              icon: const Icon(Icons.home_outlined),
              iconSize: 42),
          Badge(
            isLabelVisible: ref.watch(newRewardProvider),
            smallSize: 12,
            child: IconButton(
              onPressed: () {
                pageController.animateToPage(1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.linear);
                ref.read(newRewardProvider.notifier).update(false);
              },
              icon: const Icon(Icons.card_giftcard),
              iconSize: 42,
            ),
          ),
        ],
      ),
    );
  }
}
