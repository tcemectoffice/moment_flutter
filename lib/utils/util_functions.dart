import 'dart:io';

import 'package:flutter/material.dart';

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
