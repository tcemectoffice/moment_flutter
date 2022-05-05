import 'dart:io';

import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_popup.dart';
import 'package:moment/models/network_response_model.dart';
import 'package:moment/providers/home_page_provider.dart';
import 'package:provider/provider.dart';
import 'package:moment/services.dart' as services;

validateError(Object e) {
  print('Thrown Error: ' + e.toString() + '  ' + e.runtimeType.toString());
  if (e.runtimeType == SocketException ||
      e.toString() == 'XMLHttpRequest error.') {
    return NetworkResponseModel(status: 1000);
  } else {
    return NetworkResponseModel(status: 999);
  }
}

getScreenMargins(BuildContext context, {double extra = 0}) {
  double width = MediaQuery.of(context).size.width;
  double horizontalPadding = extra;
  if (width > 450) {
    if (width > 600) {
      horizontalPadding = (width - 600) / 2 + extra;
    } else {
      horizontalPadding = (width - 450) / 2 + extra;
    }
  }
  return EdgeInsets.symmetric(horizontal: horizontalPadding);
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
    Provider.of<HomePageNotifier>(context, listen: false).setIndex(0, context);
  } else {
    showSnackMessage(context, 'Please try again later!');
  }
}
