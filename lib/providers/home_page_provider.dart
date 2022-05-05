import 'package:flutter/material.dart';

class HomePageNotifier extends ChangeNotifier {
  int index = 0;

  setIndex(int cIndex, BuildContext context) {
    if (ModalRoute.of(context)?.settings.name != '/home') {
      Navigator.pushNamed(context, '/home');
    }
    index = cIndex;
    notifyListeners();
  }
}
