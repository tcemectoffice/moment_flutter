import 'package:flutter/material.dart';

EdgeInsets? getExtraScreenMargin(BuildContext context) {
  (context) => EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width > 450
          ? MediaQuery.of(context).size.width > 600
              ? MediaQuery.of(context).size.width > 750
                  ? MediaQuery.of(context).size.width > 900
                      ? MediaQuery.of(context).size.width > 1050
                          ? MediaQuery.of(context).size.width > 1200
                              ? MediaQuery.of(context).size.width > 1500
                                  ? MediaQuery.of(context).size.width > 1650
                                      ? 600
                                      : 550
                                  : 400
                              : 260
                          : 200
                      : 100
                  : 75
              : 30
          : 20,
      vertical: 0);
}

EdgeInsets? getScreenMargin(BuildContext context) {
  (context) => EdgeInsets.symmetric(
      horizontal: MediaQuery.of(context).size.width > 450
          ? MediaQuery.of(context).size.width > 600
              ? MediaQuery.of(context).size.width > 750
                  ? MediaQuery.of(context).size.width > 900
                      ? MediaQuery.of(context).size.width > 1050
                          ? MediaQuery.of(context).size.width > 1200
                              ? MediaQuery.of(context).size.width > 1500
                                  ? MediaQuery.of(context).size.width > 1650
                                      ? 600
                                      : 550
                                  : 400
                              : 260
                          : 200
                      : 100
                  : 75
              : 30
          : 0,
      vertical: 0);
}

const String appLogoAssetURL = 'assets/images/app_logo.png';
const String tceLogoAssetURL = 'assets/images/tce_logo.png';

final InputBorder textFormFieldEnabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(6.0),
  borderSide: const BorderSide(color: Colors.black),
);

final InputBorder textFormFieldFocusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(6.0),
  borderSide: const BorderSide(color: Colors.blue),
);

final InputBorder textFormFieldErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(6.0),
  borderSide: const BorderSide(color: Colors.red),
);

const TextStyle settingsOptionStyle =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w500);

ThemeData lightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
  scaffoldBackgroundColor: const Color(0xFFDAEDFA),
  navigationBarTheme:
      const NavigationBarThemeData(indicatorColor: Colors.greenAccent),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
  navigationBarTheme:
      NavigationBarThemeData(indicatorColor: Colors.greenAccent[700]),
);
