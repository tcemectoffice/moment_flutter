import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:moment/main.dart';
import 'utils/util_functions.dart' as utils;
import 'utils/prefs.dart' as prefs;

import 'package:moment/models/login_model.dart';

String masterURL = '';
String stagingURL = 'https://mectmoment.pythonanywhere.com';
bool isStaging = true;
String baseURL = isStaging ? stagingURL : masterURL;

String nullAlt = 'NaN--:)';

Map<String, String>? headers;

void setHeaders(String userId, String token) {
  headers = {'X-User': userId, 'X-Token': token};
}

Future<int> login(String email, String password, String fcmToken) async {
  var request =
      http.MultipartRequest('POST', Uri.parse(baseURL + '/authenticate'));
  request.fields.addAll({
    'email': email,
    'password': password,
    'login': '1',
    'isweb': kIsWeb ? '1' : '0',
    'fcmtoken': fcmToken,
  });
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print(resStr);
      LoginModel loginData = LoginModel.fromJson(jsonDecode(resStr));
      switch (loginData.status) {
        case 1:
          String userToken = response.headers['x-token']!;
          String userId = loginData.userid!.toString();
          prefs.setStringList(
              'headers', [userId, userToken]); // 0 -> userId; 1 -> userToken
          setHeaders(userId, userToken);
          return 1;
        case 2:
          return 0;
        case 0:
          return 0;
        default:
          return 2;
      }
    } else if (response.statusCode.toString().startsWith('4')) {
      print(response.reasonPhrase);
      return 2;
    } else {
      print(response.reasonPhrase);
      return 3;
    }
  } catch (error) {
    return utils.validateNetworkError(error);
  }
}

Future<bool> initApp() async {
  List<String> headerInfo = await prefs.getStringList('headers') ?? ['', ''];
  if (headerInfo[0].isEmpty || headerInfo[1].isEmpty) {
    return false;
  }
  setHeaders(headerInfo[0], headerInfo[1]);
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://mectmoment.pythonanywhere.com/initapp'));
  request.fields.addAll({'request': '1'});
  request.headers.addAll(headers!);
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String resStr = await response.stream.bytesToString();
      print(resStr);
      if (resStr == '1') {
        return true;
      } else {
        utils.showSnackMessage(
            navKey.currentState!.context, 'New Login found! Please Login!');
        return false;
      }
    } else {
      print(response.reasonPhrase);
      utils.showSnackMessage(
          navKey.currentState!.context, 'Something went wrong! Login again!');
      return false;
    }
  } catch (error) {
    print(error);
    utils.showSnackMessage(
        navKey.currentState!.context, 'No Internet! Login again!');
    return false;
  }
}

Future<bool> logout() async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://mectmoment.pythonanywhere.com/logout'));
  request.fields.addAll({
    'logout': '1',
    'isweb': kIsWeb ? '1' : '0',
  });
  request.headers.addAll(headers!);
  http.StreamedResponse response = await request.send();
  try {
    if (response.statusCode == 200) {
      String resStr = await response.stream.bytesToString();
      print(resStr);
      if (resStr == '1') {
        utils.showSnackMessage(
            navKey.currentState!.context, 'Logged out Successfully!');
        return true;
      } else {
        utils.showSnackMessage(navKey.currentState!.context,
            'Something went wrong! Try again later!');
        return false;
      }
    } else {
      print(response.reasonPhrase);
      utils.showSnackMessage(navKey.currentState!.context,
          'Something went wrong! Try again later!');
      return false;
    }
  } catch (error) {
    print(error);
    utils.showSnackMessage(
        navKey.currentState!.context, 'No Internet! Try again later!');
    return false;
  }
}
