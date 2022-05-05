import 'package:moment/models/group_model.dart';
import 'package:moment/models/post_model.dart';
import 'package:moment/models/user_model.dart';

class GroupContentModel {
  late List<Post> post;
  late List<User> user;
  late List<Group> group;
  late Group groupinfo;
  late String userdp;
  late String username;
  late int length;

  GroupContentModel(
      {required this.post,
      required this.user,
      required this.group,
      required this.userdp,
      required this.length});

  GroupContentModel.fromJson(Map<String, dynamic> json) {
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
      if (json['group'] != null) {
        group = [];
        json['group'].forEach((v) {
          group.add(Group.fromJson(v));
        });
      }
      groupinfo = Group.fromJson(json['groupinfo']);
      userdp = json['userdp'];
      username = json['username'];
      length = json['length'];
    } catch (e) {
      print('GroupInitContentError:' + e.toString());
    }
  }
}
