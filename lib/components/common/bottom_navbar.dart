import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:moment/providers/home_page_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  final int? index;
  const BottomNavBar({Key? key, this.index}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.index ??
        Provider.of<HomePageNotifier>(context, listen: false).index;
  }

  onTap(int index) {
    Provider.of<HomePageNotifier>(context, listen: false)
        .setIndex(index, context);
  }

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: index,
      onTap: onTap,
      // color: Theme.of(context).primaryColor,
      backgroundColor: Colors.transparent,
      buttonBackgroundColor:
          Theme.of(context).navigationBarTheme.indicatorColor,
      items: const [
        Icon(
          Icons.home_outlined,
        ),
        Icon(
          Icons.people_outlined,
        ),
        Icon(
          Icons.search_outlined,
        ),
        Icon(
          Icons.settings_outlined,
        ),
      ],
    );
  }
}
