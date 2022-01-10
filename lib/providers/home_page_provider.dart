import 'package:flutter/material.dart';

class HomePageNotifier extends ChangeNotifier {
  int index = 0;

  setIndex(int cIndex) {
    index = cIndex;
    notifyListeners();
  }
}
