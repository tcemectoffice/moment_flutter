import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeMode? currentTheme;
  bool? isDark;

  ThemeNotifier();

  setIsDark(bool isDark) {
    currentTheme = isDark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  getCurrentTheme() {
    var brightness = SchedulerBinding.instance!.window.platformBrightness;
    isDark = brightness == Brightness.dark;
    setIsDark(isDark!);
  }

  toggleTheme() {
    isDark = !isDark!;
    setIsDark(isDark!);
    notifyListeners();
  }
}
