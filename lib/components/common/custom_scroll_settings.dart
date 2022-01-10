import 'package:flutter/material.dart';

class CustomScrollConfig extends StatelessWidget {
  final Widget child;
  const CustomScrollConfig({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: NotificationListener<OverscrollIndicatorNotification>(
        onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return true;
        },
        child: child,
      ),
    );
  }
}
