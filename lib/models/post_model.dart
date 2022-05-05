import 'package:moment/models/file_details_model.dart';

class Post {
  late int postid;
  late int userid;
  late int groupid;
  late String postdata;
  late String posttime;
  late int likecount;
  late int commentcount;
  late List<Filedetails>? filedetails;
  late bool likestatus;
  late List<String> commentdata;
  late List<String> commenttime;
  late List<String> commentedby;
  late int commentstatus;
  late List<String> dp;
  late int delete;

  Post(
      {required this.postid,
      required this.userid,
      required this.groupid,
      required this.postdata,
      required this.posttime,
      required this.likecount,
      required this.filedetails,
      required this.likestatus,
      required this.commentdata,
      required this.commenttime,
      required this.commentedby,
      required this.commentstatus,
      required this.dp,
      required this.delete});

  Post.fromJson(Map<String, dynamic> json) {
    try {
      postid = json['postid'];
      userid = json['userid'];
      groupid = json['groupid'];
      postdata = json['postdata'];
      posttime = json['posttime'];
      likecount = json['likecount'];
      commentcount = json['commentcount'];
      if (json['filedetails'] != null) {
        filedetails = [];
        json['filedetails'].forEach((v) {
          filedetails!.add(Filedetails.fromJson(v));
        });
      }
      likestatus = json['likestatus'] == 1;
      if (json['commentdata'] != null) {
        commentdata = [];
        json['commentdata'].forEach((v) {
          commentdata.add(v.toString());
        });
      }
      if (json['commenttime'] != null) {
        commenttime = [];
        json['commenttime'].forEach((v) {
          commenttime.add(v.toString());
        });
      }
      if (json['commentedby'] != null) {
        commentedby = [];
        json['commentedby'].forEach((v) {
          commentedby.add(v.toString());
        });
      }
      commentstatus = json['commentstatus'];
      if (json['dp'] != null) {
        dp = [];
        json['dp'].forEach((v) {
          dp.add(v.toString());
        });
      }
      delete = json['delete'];
    } catch (e) {
      print('PostError: ' + e.toString());
    }
  }
}
