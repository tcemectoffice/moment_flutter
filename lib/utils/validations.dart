import 'dart:math';

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
  String pattern = r'^[a-z0-9]+@[a-z\.]*tce\.+edu$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Invalid TCE Mail ID';
  }
  return null;
}

String? validateEmail(value) {
  String pattern = r'^[a-z0-9]+@[a-z\.]*\.+[a-z]*$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Invalid Mail ID';
  }
  return null;
}

String? validateName(value) {
  String pattern = r'^[a-zA-Z\s]*$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(value)) {
    return 'Name should contain only Alphabets';
  }
  return null;
}
