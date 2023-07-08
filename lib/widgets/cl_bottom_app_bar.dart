import 'package:flutter/material.dart';

class ClBottomAppBar extends StatelessWidget {
  const ClBottomAppBar({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
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
          IconButton(
            onPressed: () => pageController.animateToPage(1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear),
            icon: const Icon(Icons.card_giftcard),
            iconSize: 42,
          ),
        ],
      ),
    );
  }
}
