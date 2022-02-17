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

InputDecoration textFieldDecoration() {
  return const InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 3.0),
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
    ),
  );
}

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
  primaryColor: Colors.blueGrey,
  indicatorColor: Colors.blueGrey,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.blueGrey,
  ),
  scaffoldBackgroundColor: const Color(0xFFDAEDFA),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
    filled: true,
    fillColor: const Color(0xfff4f4f4),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(10.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(6.0),
      borderSide: const BorderSide(color: Colors.red),
    ),
  ),
  navigationBarTheme:
      const NavigationBarThemeData(indicatorColor: Colors.greenAccent),
  buttonTheme: const ButtonThemeData(
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    buttonColor: Colors.greenAccent,
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    backgroundColor: Colors.greenAccent,
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey,
    appBarTheme: const AppBarTheme(backgroundColor: Colors.blueGrey),
    navigationBarTheme:
        NavigationBarThemeData(indicatorColor: Colors.greenAccent[700]),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(10.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6.0),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
    buttonTheme: ButtonThemeData(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      buttonColor: Colors.greenAccent[700],
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      splashColor: Colors.transparent,
      hoverColor: Colors.transparent,
      backgroundColor: Colors.greenAccent[700],
    ));
