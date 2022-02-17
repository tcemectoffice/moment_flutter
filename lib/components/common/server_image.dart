import 'package:flutter/material.dart';
import 'package:moment/services.dart' as services;

NetworkImage serverImage(String imageUrl) {
  return NetworkImage(services.baseURL + '/' + imageUrl);
}
