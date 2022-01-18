import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_popup.dart';
import 'package:moment/providers/home_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:moment/services.dart' as services;

validateNetworkError(Object e) {
  print(e.toString() + e.runtimeType.toString());
  if (e.runtimeType == SocketException ||
      e.toString() == 'XMLHttpRequest error.') {
    return 4;
  } else {
    return 3;
  }
}

bool handleNetworkResponse(int code) {
  if (code == 1) {
    return true;
  } else {
    return false;
  }
}

showSnackMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

logout(BuildContext context) async {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => const CustomPopup(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
  if (await services.logout()) {
    Navigator.of(context).pushNamed('/login');
    Provider.of<HomePageNotifier>(context, listen: false).setIndex(0);
  } else {
    showSnackMessage(context, 'Please try again later!');
  }
}
