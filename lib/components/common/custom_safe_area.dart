import 'package:flutter/material.dart';

class CustomSafeArea extends StatelessWidget {
  final int status; //0 -> no internet; 1 -> normal; 2/else -> no access;
  final Widget child;
  const CustomSafeArea({
    Key? key,
    required this.child,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case 0:
        return const Center(
          child: Icon(Icons.wifi_off_rounded),
        );
      case 1:
        return child;
      default:
        return const Center(
          child: Icon(Icons.warning_amber_outlined),
        );
    }
  }
}
