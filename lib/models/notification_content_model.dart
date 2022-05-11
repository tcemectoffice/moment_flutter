import 'package:moment/models/notification_model.dart';

class NotificationContentModel {
  late List<NotificationModel>? content;

  NotificationContentModel({this.content});

  NotificationContentModel.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = [];
      json['content'].forEach((v) {
        content?.add(NotificationModel.fromJson(v));
      });
    }
  }
}
