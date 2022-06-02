import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:moment/models/file_details_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:moment/main.dart';
import 'package:moment/models/network_response_model.dart';
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/utils/prefs.dart' as prefs;

import 'package:moment/models/login_model.dart';

String masterURL = '';
String stagingURL = 'https://mectmoment.pythonanywhere.com';
bool isStaging = true;
String baseURL = isStaging ? stagingURL : masterURL;
List<String> imageExtensions = [];

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
          String userId = loginData.userid.toString();
          prefs.setStringList(
              'headers', [userId, userToken]); // 0 -> userId; 1 -> userToken
          setHeaders(userId, userToken);
          prefs.setString('userName', loginData.username ?? '');
          prefs.setString('userEmail', loginData.useremail ?? '');
          prefs.setString('userDp', loginData.userdp ?? '');
          prefs.setInt('userType', loginData.usertype ?? 5);
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
  request.headers.addAll(headers ?? {});
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
  request.headers.addAll(headers ?? {});
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
  request.headers.addAll(headers ?? {});
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('homeInit: ' + resStr);
      NetworkResponseModel homeInitData =
          NetworkResponseModel.fromJson(jsonDecode(resStr));
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
    'GET',
    Uri.parse(baseURL + '/home-lazy-content')
        .replace(queryParameters: {'startpost': startIndex.toString()}),
  );
  request.headers.addAll(headers ?? {});
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
      http.MultipartRequest('POST', Uri.parse(baseURL + '/like-save'));
  request.fields.addAll({
    'postid': postId.toString(),
    'likestatus': likeStatus ? '1' : '0',
  });
  request.headers.addAll(headers ?? {});
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
    print('likePost: ' + error.toString());
    return false;
  }
}

Future<bool> postComment(int postId, String comment) async {
  var request =
      http.MultipartRequest('POST', Uri.parse(baseURL + '/comment-save'));
  request.fields.addAll({
    'postid': postId.toString(),
    'commentdata': comment,
  });
  request.headers.addAll(headers ?? {});
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
    print('commentPost: ' + error.toString());
    return false;
  }
}

Future<bool> tutorSave(int tutorId) async {
  var request =
      http.MultipartRequest('POST', Uri.parse(baseURL + '/tutor-save'));
  request.fields.addAll({
    'tutorid': tutorId.toString(),
  });
  request.headers.addAll(headers ?? {});
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('AddTutor: ' + resStr);
      return resStr == '1';
    } else {
      print('AddTutor: ' + response.reasonPhrase.toString());
      return false;
    }
  } catch (error) {
    print('AddTutor: ' + error.toString());
    return false;
  }
}

Future<bool> addPost(int grpId, String postData, bool isPrivate,
    List<int> selectedStaff, File? attachedFile) async {
  var request = http.MultipartRequest('POST', Uri.parse(baseURL + '/add-post'));
  String extension = attachedFile?.path.split('.').last ?? '';
  bool isImg = imageExtensions.contains(extension);
  request.headers.addAll(headers ?? {});
  request.fields.addAll({
    'groupid': grpId.toString(),
    'posttext': postData,
    'postprivacy': isPrivate ? '1' : '0',
    'selectedstaff': selectedStaff.join(','),
    'fileattached': attachedFile == null ? '0' : '1',
    'isimg': isImg ? '1' : '0',
    'extension': extension,
  });
  if (attachedFile != null) {
    http.MultipartFile postAttachment =
        await http.MultipartFile.fromPath('file', attachedFile.path);
    request.files.add(postAttachment);
  }
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('AddPost: ' + resStr);
      return resStr == '1';
    } else {
      print('AddPost: ' + response.reasonPhrase.toString());
      return false;
    }
  } catch (error) {
    print('AddPost: ' + error.toString());
    return false;
  }
}

downloadFile(Filedetails file, String filePath) async {
  var storageStatus = await Permission.storage.status;
  if (!storageStatus.isGranted) {
    await Permission.storage.request();
  }
  try {
    var httpClient = HttpClient();
    var request =
        await httpClient.getUrl(Uri.parse(baseURL + '/' + file.fileurl));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    await File(filePath).create(recursive: true).then((newFile) {
      newFile.writeAsBytes(bytes);
    });
    print('file stored in $filePath');
    return true;
  } catch (e) {
    print('File Download Error: ${e.toString()}');
    return false;
  }
}

Future<NetworkResponseModel> getGroupsInitContent(int gid1) async {
  var request = http.Request(
    'GET',
    Uri.parse(baseURL + '/group-post-filter')
        .replace(queryParameters: {'gid1': gid1.toString()}),
  );
  request.headers.addAll(headers ?? {});
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('groupsInit: ' + resStr);
      NetworkResponseModel groupsInitData =
          NetworkResponseModel.fromJson(jsonDecode(resStr));
      return groupsInitData;
    } else {
      print('groupsInit: ' + response.reasonPhrase.toString());
      return NetworkResponseModel(status: 999);
    }
  } catch (error) {
    print('groupsInit: ' + error.toString());
    return utils.validateError(error);
  }
}

Future<NetworkResponseModel> getGroupsLazyContent(int startIndex) async {
  var request = http.Request(
    'GET',
    Uri.parse(baseURL + '/iterate-group-post-filter')
        .replace(queryParameters: {'startpost': startIndex.toString()}),
  );
  request.headers.addAll(headers ?? {});
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('groupsLazyInit: ' + resStr);
      NetworkResponseModel groupsLazyData =
          NetworkResponseModel.fromJson(jsonDecode(resStr));
      return groupsLazyData;
    } else {
      print('groupsLazyInit: ' + response.reasonPhrase.toString());
      return NetworkResponseModel(status: 999);
    }
  } catch (error) {
    print('groupsLazyInit: ' + error.toString());
    return utils.validateError(error);
  }
}

Future<NetworkResponseModel> searchEntities(String searchPhrase) async {
  var request = http.Request(
    'GET',
    Uri.parse(baseURL + '/search-list')
        .replace(queryParameters: {'name': searchPhrase}),
  );
  request.headers.addAll(headers ?? {});
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('searchList: ' + resStr);
      NetworkResponseModel searchResult =
          NetworkResponseModel.fromJson(jsonDecode(resStr));
      return searchResult;
    } else {
      print('searchList: ' + response.reasonPhrase.toString());
      return NetworkResponseModel(status: 999);
    }
  } catch (error) {
    print('searchList: ' + error.toString());
    return utils.validateError(error);
  }
}

Future<NetworkResponseModel> userProfile(int userid) async {
  var request = http.Request(
    'GET',
    Uri.parse(baseURL + '/profileinfo')
        .replace(queryParameters: {'userid': userid.toString()}),
  );
  request.headers.addAll(headers ?? {});
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('profileInfo: ' + resStr);
      NetworkResponseModel profileInfo =
          NetworkResponseModel.fromJson(jsonDecode(resStr));
      return profileInfo;
    } else {
      print('profileInfo: ' + response.reasonPhrase.toString());
      return NetworkResponseModel(status: 999);
    }
  } catch (error) {
    print('profileInfo: ' + error.toString());
    return utils.validateError(error);
  }
}

Future<bool> editProfile(String? name, String? regNum, String? email,
    String? phone, File? dp) async {
  var request =
      http.MultipartRequest('POST', Uri.parse(baseURL + '/editprofdetails'));
  String? extension = dp?.path.split('.').last;
  print(extension);
  if (name != null) {
    request.fields['name'] = name;
  }

  if (regNum != null) {
    request.fields['regnum'] = regNum;
  }

  if (email != null) {
    request.fields['email'] = email;
  }

  if (phone != null) {
    request.fields['phone'] = phone;
  }

  if (extension != null) {
    request.fields['extension'] = extension;
  }

  if (dp != null) {
    http.MultipartFile postAttachment =
        await http.MultipartFile.fromPath('file', dp.path);
    request.files.add(postAttachment);
  }

  request.headers.addAll(headers ?? {});

  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('editProfile: ' + resStr);
      if (resStr == '1') {
        return true;
      } else {
        print('editProfile: error ' + resStr);
        return false;
      }
    } else {
      print('editProfile: ' + response.reasonPhrase.toString());
      return false;
    }
  } catch (error) {
    print('editProfile: ' + error.toString());
    return false;
  }
}

Future<NetworkResponseModel> getNotificationsList() async {
  if (headers == null) {
    List<String> headerInfo = await prefs.getStringList('headers');
    setHeaders(headerInfo[0], headerInfo[1]);
  }
  var request = http.Request(
    'GET',
    Uri.parse(baseURL + '/init-notification')
        .replace(queryParameters: {'notificationtime': '1'}),
  );
  request.headers.addAll(headers ?? {});
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('init-notification: ' + resStr);
      NetworkResponseModel profileInfo =
          NetworkResponseModel.fromJson(jsonDecode(resStr));
      return profileInfo;
    } else {
      print('init-notification: ' + response.reasonPhrase.toString());
      return NetworkResponseModel(status: 999);
    }
  } catch (error) {
    print('init-notification: ' + error.toString());
    return utils.validateError(error);
  }
}

Future<NetworkResponseModel> getPostSingle(int postId) async {
  var request = http.Request(
    'GET',
    Uri.parse(baseURL + '/get-single-post')
        .replace(queryParameters: {'postid': postId.toString()}),
  );
  request.headers.addAll(headers ?? {});
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('get-single-post: ' + resStr);
      NetworkResponseModel profileInfo =
          NetworkResponseModel.fromJson(jsonDecode(resStr));
      return profileInfo;
    } else {
      print('get-single-post: ' + response.reasonPhrase.toString());
      return NetworkResponseModel(status: 999);
    }
  } catch (error) {
    print('get-single-post: ' + error.toString());
    return utils.validateError(error);
  }
}

Future<NetworkResponseModel> getWardList() async {
  var request = http.Request(
    'GET',
    Uri.parse(baseURL + '/wardinfo'),
  );
  request.headers.addAll(headers ?? {});
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('wardList: ' + resStr);
      NetworkResponseModel searchResult =
          NetworkResponseModel.fromJson(jsonDecode(resStr));
      return searchResult;
    } else {
      print('wardList: ' + response.reasonPhrase.toString());
      return NetworkResponseModel(status: 999);
    }
  } catch (error) {
    print('wardList: ' + error.toString());
    return utils.validateError(error);
  }
}

Future<bool> changePassword(String password, String newPassword) async {
  var request =
      http.MultipartRequest('POST', Uri.parse(baseURL + '/changepassword'));
  request.fields.addAll({
    'currentpassword': password,
    'newpassword': newPassword,
  });
  request.headers.addAll(headers ?? {});
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('changePassword: ' + resStr);
      return resStr == '1';
    } else {
      print('changePassword: ' + response.reasonPhrase.toString());
      return false;
    }
  } catch (error) {
    print('changePassword: ' + error.toString());
    return false;
  }
}

Future<bool> deletePost(int postId) async {
  var request =
      http.MultipartRequest('POST', Uri.parse(baseURL + '/post-delete'));
  request.fields.addAll({
    'deletepost': '1',
    'postid': postId.toString(),
  });
  request.headers.addAll(headers ?? {});
  try {
    http.StreamedResponse response = await request.send();
    if (response.statusCode.toString().startsWith('2')) {
      String resStr = await response.stream.bytesToString();
      print('deletePost: ' + resStr);
      return resStr == '1';
    } else {
      print('deletePost: ' + response.reasonPhrase.toString());
      return false;
    }
  } catch (error) {
    print('deletePost: ' + error.toString());
    return false;
  }
}
