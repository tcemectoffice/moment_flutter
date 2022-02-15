import 'package:moment/models/home_init_content_model.dart';

class NetworkResponseModel {
  late int status;
  late String message;
  late var data;

  NetworkResponseModel(
      {required this.status, required this.message, required this.data});

  NetworkResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    switch (status) {
      case 1:
        data = HomeContentModel.fromJson(json['data']);
        break;
      case 999:
        throw 'Failed Request';
      default:
        throw 'Failed Request';
    }
  }
}
