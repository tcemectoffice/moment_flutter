import 'package:moment/models/group_model.dart';
import 'package:moment/models/post_model.dart';
import 'package:moment/models/user_model.dart';

class HomeLazyContentModel {
  late List<Post> post;
  late List<User> user;
  late List<Group> group;

  HomeLazyContentModel(
      {required this.post, required this.user, required this.group});

  HomeLazyContentModel.fromJson(Map<String, dynamic> json) {
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
    } catch (e) {
      print('HomeLazyError: ' + e.toString());
    }
  }
}
