import 'dart:io';

import 'package:flutter/material.dart';

class NewPostNotifier extends ChangeNotifier {
  int targetId = 7;
  File? postAttachment;

  uploadFile(String filePath) {
    postAttachment = File(filePath);
    notifyListeners();
  }

  setTargetId(int value) {
    targetId = value;
    notifyListeners();
  }
}
