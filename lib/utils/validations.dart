import 'dart:math';
import 'package:moment/models/constants.dart' as constants;

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

String? validatePassword(value) {
  if (value.length < 8) {
    return 'Password must be atleast 8 characters';
  }
  return null;
}

String? validateTceEmail(value) {
  String pattern = r'^[a-z0-9][a-z0-9\_\.]+@(tce\.edu|student\.tce\.edu)$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Invalid TCE Mail ID';
  }
  return null;
}

String? validateEmail(value, {bool isOptional = false}) {
  if (isOptional && (value == null || value == '')) return null;
  String pattern = r'^[a-z0-9][a-z0-9\_\.]+@[a-z\.]*\.+[a-z]*$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Invalid Mail ID';
  }
  return null;
}

String? validateName(value, {bool isOptional = false}) {
  if (isOptional && (value == null || value == '')) return null;
  String pattern = r'^[a-zA-Z\s]*$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Name should contain only Alphabets';
  }
  return null;
}

String? validatePhone(value, {bool isOptional = false}) {
  if (isOptional && (value == null || value == '')) return null;
  if (!constants.phoneRegex.hasMatch(value)) {
    return 'Enter a valid Phone number';
  }
  return null;
}

String? validateRegNum(value, {bool isOptional = false}) {
  if (isOptional && (value == null || value == '')) return null;
  String pattern = r'^[0-9]{2}[A-Z][0-9]{3}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Invalid Register Number';
  }
  return null;
}
