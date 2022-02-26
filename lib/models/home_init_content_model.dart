import 'package:moment/models/group_model.dart';
import 'package:moment/models/post_model.dart';
import 'package:moment/models/user_model.dart';

class HomeContentModel {
  late List<Post> post;
  late List<User> user;
  late List<User> staffdetails;
  late List<Group> group;
  late List<Group> postgroup;
  late String userdp;
  late String username;
  User? tutor;
  late int length;

  HomeContentModel(
      {required this.post,
      required this.user,
      required this.staffdetails,
      required this.group,
      required this.postgroup,
      required this.userdp,
      required this.username,
      required this.tutor,
      required this.length});

  HomeContentModel.fromJson(Map<String, dynamic> json) {
    try {
      if (json['post'] != null) {
        post = [];
        json['post'].forEach((v) {
          post.add(Post.fromJson(v));
        });
      }
      if (json['user'] != null) {
        user = [];
        json['user'].forEach((v) {
          user.add(User.fromJson(v));
        });
      }
      if (json['staffdetails'] != null) {
        staffdetails = [];
        json['staffdetails'].forEach((v) {
          staffdetails.add(User.fromJson(v));
        });
      }
      if (json['group'] != null) {
        group = [];
        json['group'].forEach((v) {
          group.add(Group.fromJson(v));
        });
      }
      if (json['postgroup'] != null) {
        postgroup = [];
        json['postgroup'].forEach((v) {
          postgroup.add(Group.fromJson(v));
        });
      }
      userdp = json['userdp'];
      username = json['username'];
      length = json['length'];
      if (json['tutor'] != null) tutor = User.fromJson(json['tutor']);
    } catch (e) {
      print('HomeContentError:' + e.toString());
    }
  }
}

/*

{
    "status": 1,
    "message": "success",
    "HomeContentModel": {
        "post": [
            {
                "postid": 2,
                "userid": 58,
                "groupid": 1,
                "postHomeContentModel": "image post django admin",
                "fileurl": "static/post/post_4_13KLRISD.jpg",
                "posttime": "05/02/2022 11:32:55",
                "likecount": 0,
                "filedetails": [
                    {
                        "isimage": 1,
                        "filesize": "1312000"
                    }
                ],
                "likestatus": 0,
                "commentHomeContentModel": "NaN--:)",
                "commenttime": "NaN--:)",
                "commentstatus": 0,
                "dp": "NaN--:)",
                "delete": 0
            },
            {
                "postid": 1,
                "userid": 58,
                "groupid": 1,
                "postHomeContentModel": "post django admin",
                "fileurl": "NaN--:)",
                "posttime": "05/02/2022 11:22:55",
                "likecount": 0,
                "filedetails": [
                    {
                        "isimage": 0,
                        "filesize": "NaN--:)"
                    }
                ],
                "likestatus": 0,
                "commentHomeContentModel": "NaN--:)",
                "commenttime": "NaN--:)",
                "commentstatus": 0,
                "dp": "NaN--:)",
                "delete": 0
            }
        ],
        "user": [
            {
                "name": "?RAM",
                "reg_no": "NaN--:)",
                "profilepic": "static/images/profile-user.png",
                "altemail": "NaN--:)"
            },
            {
                "name": "?RAM",
                "reg_no": "NaN--:)",
                "profilepic": "static/images/profile-user.png",
                "altemail": "NaN--:)"
            }
        ],
        "group": [
            {
                "groupname": "MECT-General",
                "groupdp": "static/group/MECT - General.png"
            },
            {
                "groupname": "MECT-General",
                "groupdp": "static/group/MECT - General.png"
            }
        ],
        "userdp": "static/images/profile-user.png",
        "username": "?RAM",
        "length": 2
    }
}

*/