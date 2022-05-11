import 'package:moment/models/group_init_content_model.dart';
import 'package:moment/models/home_init_content_model.dart';
import 'package:moment/models/lazy_content_model.dart';
import 'package:moment/models/notification_content_model.dart';
import 'package:moment/models/search_entity_model.dart';
import 'package:moment/models/single_post_data_model.dart';
import 'package:moment/models/user_model.dart';

class NetworkResponseModel {
  late int status;
  late String? message;
  dynamic data;

  NetworkResponseModel({required this.status, this.message, this.data});

  NetworkResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    switch (status) {
      case 1:
        data = HomeContentModel.fromJson(json['data']);
        break;
      case 2:
        data = LazyContentModel.fromJson(json['data']);
        break;
      case 3:
        data = GroupContentModel.fromJson(json['data']);
        break;
      case 4:
        data = json['data']
            .map((dataPoint) => SearchEntityModel.fromJson(dataPoint))
            .toList();
        break;
      case 5:
        data = User.fromJson(json['data']);
        break;
      case 6:
        data = NotificationContentModel.fromJson(json['data']);
        break;
      case 7:
        data = SinglePostDataModel.fromJson(json['data']);
        break;
      case 999:
        throw 'Failed Request';
      default:
        throw 'Failed Request';
    }
  }
}
