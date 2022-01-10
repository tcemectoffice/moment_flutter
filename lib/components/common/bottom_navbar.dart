import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int index;
  final void Function(int) onTap;
  const BottomNavBar({Key? key, required this.index, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: index,
      onTap: onTap,
      color: Colors.blueGrey,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor:
          Theme.of(context).navigationBarTheme.indicatorColor,
      items: const [
        Icon(
          Icons.home_outlined,
        ),
        Icon(
          Icons.book_outlined,
        ),
        Icon(
          Icons.search,
        ),
        Icon(
          Icons.settings,
        ),
      ],
    );
  }
}
