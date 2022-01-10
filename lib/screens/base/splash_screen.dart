import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moment/constants.dart' as constants;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? userLoggedIn;

  setLoginInfo() async {
    return 1;
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      setLoginInfo().then((value) {
        Navigator.pushNamed(context, '/login');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage(constants.tceLogoAssetURL),
          height: 300,
        ),
      ),
    );
  }
}
