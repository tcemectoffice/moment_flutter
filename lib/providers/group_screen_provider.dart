import 'package:flutter/material.dart';
import 'package:moment/models/group_init_content_model.dart';
import 'package:moment/models/lazy_content_model.dart';

class GroupScreenNotifier extends ChangeNotifier {
  GroupContentModel? groupScreenData;

  setGroupData(GroupContentModel data) {
    groupScreenData = data;
    notifyListeners();
  }

  extendGroupData(LazyContentModel lazyData) {
    groupScreenData!.post.addAll(lazyData.post);
    groupScreenData!.user.addAll(lazyData.user);
    groupScreenData!.group.addAll(lazyData.group);
    notifyListeners();
  }

  toggleLike(int postIndex) {
    groupScreenData!.post[postIndex].likestatus =
        !(groupScreenData!.post[postIndex].likestatus);
    groupScreenData!.post[postIndex].likestatus
        ? groupScreenData!.post[postIndex].likecount++
        : groupScreenData!.post[postIndex].likecount--;
    notifyListeners();
  }

  addComment(int postIndex, String comment) async {
    groupScreenData!.post[postIndex].commentdata.insert(0, comment);
    groupScreenData!.post[postIndex].commentedby
        .insert(0, groupScreenData!.username);
    groupScreenData!.post[postIndex].dp.insert(0, groupScreenData!.userdp);
    groupScreenData!.post[postIndex].commentcount++;
    notifyListeners();
  }

  toggleFileStatus(int postId, String fileName) {
    groupScreenData!.post
        .firstWhere((post) => post.postid == postId)
        .filedetails!
        .firstWhere((file) => file.filename == fileName)
        .fileDownloaded = true;
    notifyListeners();
  }

  deletePost(int postIndex) {
    groupScreenData!.post.removeAt(postIndex);
    groupScreenData!.user.removeAt(postIndex);
    groupScreenData!.group.removeAt(postIndex);
    notifyListeners();
  }
}
