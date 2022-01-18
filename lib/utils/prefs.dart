import 'package:shared_preferences/shared_preferences.dart';

void setInt(String key, int value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt(key, value);
}

void setString(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value);
}

void setStringList(String key, List<String> value) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setStringList(key, value);
}

void addToStringList(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? list = prefs.getStringList(key);
  list!.add(value);
  prefs.setStringList(key, list);
}

Future<bool> checkInStrList(String key, String value) async {
  final prefs = await SharedPreferences.getInstance();
  List<String>? list = prefs.getStringList(key);
  return list!.contains(value);
}

Future<dynamic> getInt(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt(key);
}

Future<dynamic> getString(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<dynamic> getStringList(String key) async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getStringList(key);
}
