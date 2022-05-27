import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moment/models/constants.dart' as constants;
import 'package:moment/services.dart' as services;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? userLoggedIn;

  Future<bool> initialize() async {
    return await services.initApp();
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      initialize().then((value) {
        if (value) {
          Navigator.pushNamed(context, '/home');
        } else {
          Navigator.pushNamed(context, '/login');
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Center(
          child: Image(
            image: AssetImage(constants.tceLogoAssetURL),
            height: 300,
          ),
        ),
      ),
    );
  }
}
