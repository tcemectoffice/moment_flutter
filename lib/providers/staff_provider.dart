import 'package:flutter/material.dart';
import 'package:moment/models/user_model.dart';

class StaffNotifier extends ChangeNotifier {
  List<User>? staffDetails;

  setStaffDetails(List<User> inDetails) {
    staffDetails = inDetails;
  }
}
