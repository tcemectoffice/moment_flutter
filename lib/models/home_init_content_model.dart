import 'package:moment/models/group_model.dart';
import 'package:moment/models/post_model.dart';
import 'package:moment/models/user_model.dart';

class HomeContentModel {
  late List<Post> post;
  late List<User> user;
  late List<User> staffdetails;
  late List<User> warddetails;
  late List<Group> group;
  late List<Group> postgroup;
  late String userdp;
  late String username;
  User? tutor;
  late int length;

  HomeContentModel(
      {required this.post,
      required this.user,
      required this.warddetails,
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
      if (json['warddetails'] != null) {
        warddetails = [];
        json['warddetails'].forEach((v) {
          warddetails.add(User.fromJson(v));
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
