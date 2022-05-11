import 'package:moment/models/post_model.dart';
import 'package:moment/models/user_model.dart';

import 'group_model.dart';

class SinglePostDataModel {
  late Post post;
  late User user;
  late Group group;

  SinglePostDataModel(
      {required this.post, required this.user, required this.group});

  SinglePostDataModel.fromJson(Map<String, dynamic> json) {
    post = Post.fromJson(json['post']);
    user = User.fromJson(json['user']);
    group = Group.fromJson(json['group']);
  }
}
