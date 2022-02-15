import 'package:moment/models/file_details_model.dart';

class Post {
  late int postid;
  late int userid;
  late int groupid;
  late String postdata;
  late String fileurl;
  late String posttime;
  late int likecount;
  late int commentcount;
  List<Filedetails>? filedetails;
  late int likestatus;
  List<String>? commentdata;
  List<String>? commenttime;
  late int commentstatus;
  late List<String>? dp;
  late int delete;

  Post(
      {required this.postid,
      required this.userid,
      required this.groupid,
      required this.postdata,
      required this.fileurl,
      required this.posttime,
      required this.likecount,
      this.filedetails,
      required this.likestatus,
      this.commentdata,
      this.commenttime,
      required this.commentstatus,
      this.dp,
      required this.delete});

  Post.fromJson(Map<String, dynamic> json) {
    postid = json['postid'];
    userid = json['userid'];
    groupid = json['groupid'];
    postdata = json['postdata'];
    fileurl = json['fileurl'];
    posttime = json['posttime'];
    likecount = json['likecount'];
    commentcount = json['commentcount'];
    if (json['filedetails'] != null) {
      filedetails = [];
      json['filedetails'].forEach((v) {
        filedetails!.add(Filedetails.fromJson(v));
      });
    }
    likestatus = json['likestatus'];
    commentdata = json['commentdata'];
    commenttime = json['commenttime'];
    commentstatus = json['commentstatus'];
    dp = json['dp'];
    delete = json['delete'];
  }
}
