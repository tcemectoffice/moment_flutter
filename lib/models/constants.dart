import 'package:flutter/material.dart';

const String appLogoAssetURL = 'assets/images/app_logo.png';
const String tceLogoAssetURL = 'assets/images/tce_logo.png';

RegExp phoneRegex = RegExp(
  r'^(\+91[\-\s]?)?[0]?(91)?[6-9]\d{9}$',
);

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
  //PRIMARY COLOR
  // primaryColor: Colors.white,
  primaryColor: const Color.fromARGB(255, 118, 200, 255),

  //APPBAR THEME
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    shadowColor: Colors.black,
  ),

  //SCAFFOLD BACKGROUND COLOR
  scaffoldBackgroundColor: const Color(0xFFDAEDFA),

  //THEME FOR INPUT FIELD
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

  //NAVBAR THEME
  navigationBarTheme: const NavigationBarThemeData(
    indicatorColor: Color.fromARGB(255, 99, 192, 255),
  ),

  //BUTTON THEME
  buttonTheme: const ButtonThemeData(
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    highlightColor: Colors.transparent,
    buttonColor: Color.fromARGB(255, 118, 200, 255),
  ),

  //ICON THEME
  iconTheme: const IconThemeData(color: Colors.black),

  //FLOATING ACTION BUTTON THEME
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,
    backgroundColor: Color.fromARGB(255, 118, 200, 255),
  ),
);

ThemeData darkTheme = ThemeData.dark().copyWith(
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
