import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:moment/main.dart';
import 'package:moment/models/network_response_model.dart';
import 'package:moment/utils/util_functions.dart' as utils;
import 'utils/prefs.dart' as prefs;

import 'package:moment/models/login_model.dart';

String masterURL = '';
String stagingURL = 'https://mectmoment.pythonanywhere.com';
bool isStaging = true;
String baseURL = isStaging ? stagingURL : masterURL;

String nullAlt = 'NaN--:)';

Map<String, String>? headers;

void setHeaders(String userId, String token) {
  headers = {'X-User': userId, 'X-Token': token, 'Cookie': 'sessionid=$token'};
}

Future<NetworkResponseModel> login(
    String email, String password, String fcmToken) async {
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
      print('login: ' + resStr);
      LoginModel loginData = LoginModel.fromJson(jsonDecode(resStr));
      switch (loginData.status) {
        case 1:
          String userToken = response.headers['x-token']!;
          print(userToken);
          String userId = loginData.userid!.toString();
          prefs.setStringList(
              'headers', [userId, userToken]); // 0 -> userId; 1 -> userToken
          setHeaders(userId, userToken);
          return NetworkResponseModel(status: 1);
        case 2:
          return NetworkResponseModel(status: 0);
        case 0:
          return NetworkResponseModel(status: 0);
        default:
          return NetworkResponseModel(status: 999);
      }
    } else if (response.statusCode.toString().startsWith('4')) {
      print('login: ' + response.reasonPhrase.toString());
      return NetworkResponseModel(status: 999);
    } else {
      print('login: ' + response.reasonPhrase.toString());
      return NetworkResponseModel(status: 999);
    }
  } catch (error) {
    return utils.validateError(error);
  }
}

Future<bool> initApp() async {
  List<String> headerInfo = await prefs.getStringList('headers') ?? ['', ''];
  if (headerInfo[0].isEmpty || headerInfo[1].isEmpty) {
    return false;
  }
  setHeaders(headerInfo[0], headerInfo[1]);
  var request = http.MultipartRequest('POST', Uri.parse(baseURL + '/init-app'));
  request.fields.addAll({'request': '1'});
  request.headers.addAll(headers!);
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String resStr = await response.stream.bytesToString();
      print('initialize: ' + resStr);
      if (resStr == '1') {
        return true;
      } else {
        utils.showSnackMessage(
            navKey.currentState!.context, 'New Login found! Please Login!');
        return false;
      }
    } else {
      print('initialize: ' + response.reasonPhrase.toString());
      utils.showSnackMessage(
          navKey.currentState!.context, 'Something went wrong! Login again!');
      return false;
    }
  } catch (error) {
    print('initialize: ' + error.toString());
    utils.showSnackMessage(
        navKey.currentState!.context, 'No Internet! Login again!');
    return false;
  }
}

Future<bool> logout() async {
  var request = http.MultipartRequest('POST', Uri.parse(baseURL + '/logout'));
  request.fields.addAll({
    'logout': '1',
    'isweb': kIsWeb ? '1' : '0',
  });
  request.headers.addAll(headers!);
  http.StreamedResponse response = await request.send();
  try {
    if (response.statusCode == 200) {
      String resStr = await response.stream.bytesToString();
      print('logout: ' + resStr);
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
      print('logout: ' + response.reasonPhrase.toString());
      utils.showSnackMessage(navKey.currentState!.context,
          'Something went wrong! Try again later!');
      return false;
    }
  } catch (error) {
    print('logout: ' + error.toString());
    utils.showSnackMessage(
        navKey.currentState!.context, 'No Internet! Try again later!');
    return false;
  }
}

Future<NetworkResponseModel> getHomeInitContent() async {
  var request = http.Request('GET', Uri.parse(baseURL + '/home-content'));
  request.headers.addAll(headers!);
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('homeInit: ' + resStr);
      NetworkResponseModel homeInitData =
          NetworkResponseModel.fromJson(jsonDecode(resStr));
      prefs.setString('user-name', homeInitData.data.username);
      prefs.setString('user-dp', homeInitData.data.userdp);
      return homeInitData;
    } else {
      print('homeInit: ' + response.reasonPhrase.toString());
      return NetworkResponseModel(status: 999);
    }
  } catch (error) {
    return utils.validateError(error);
  }
}

Future<NetworkResponseModel> getHomeLazyContent(int startIndex) async {
  var request = http.Request(
      'GET', Uri.parse(baseURL + '/home-lazy-content?startpost=$startIndex'));
  request.headers.addAll(headers!);
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('homeLazyInit: ' + resStr);
      NetworkResponseModel homeLazyData =
          NetworkResponseModel.fromJson(jsonDecode(resStr));
      return homeLazyData;
    } else {
      print('homeLazyInit: ' + response.reasonPhrase.toString());
      return NetworkResponseModel(status: 999);
    }
  } catch (error) {
    return utils.validateError(error);
  }
}

Future<bool> postLike(int postId, bool likeStatus) async {
  var request =
      http.MultipartRequest('POST', Uri.parse(baseURL + '/like_save'));
  request.fields.addAll({
    'postid': postId.toString(),
    'likestatus': likeStatus ? '1' : '0',
  });
  request.headers.addAll(headers!);
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('likePost: ' + resStr);
      return resStr == '1';
    } else {
      print('likePost: ' + response.reasonPhrase.toString());
      return false;
    }
  } catch (error) {
    utils.validateError(error);
    return false;
  }
}

Future<bool> postComment(int postId, String comment) async {
  var request =
      http.MultipartRequest('POST', Uri.parse(baseURL + '/comment_save'));
  request.fields.addAll({
    'postid': postId.toString(),
    'commentdata': comment,
  });
  request.headers.addAll(headers!);
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('commentPost: ' + resStr);
      return resStr == '1';
    } else {
      print('commentPost: ' + response.reasonPhrase.toString());
      return false;
    }
  } catch (error) {
    utils.validateError(error);
    return false;
  }
}
