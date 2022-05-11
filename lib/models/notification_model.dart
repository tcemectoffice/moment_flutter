class NotificationModel {
  late int postid;
  late String type;
  late String notificationContent;
  late String name;
  late String dp;
  late String gname;
  late bool isnew;
  late String? fileurl;

  NotificationModel({
    required this.postid,
    required this.type,
    required this.notificationContent,
    required this.name,
    required this.dp,
    required this.gname,
    required this.isnew,
    this.fileurl,
  });

  NotificationModel.fromJson(Map<String, dynamic> json) {
    postid = json['postid'];
    type = json['type'];
    notificationContent = json['notificationContent'];
    name = json['name'];
    dp = json['dp'];
    gname = json['gname'];
    isnew = json['isnew'] == '1';
    fileurl = json['fileurl'];
  }
}
