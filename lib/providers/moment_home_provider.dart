import 'package:flutter/material.dart';
import 'package:moment/models/home_init_content_model.dart';
import 'package:moment/models/home_lazy_content_model.dart';

class MomentHomeNotifier extends ChangeNotifier {
  HomeContentModel? momentHomeData;

  setHomeData(HomeContentModel data) {
    momentHomeData = data;
  }

  extendHomeData(HomeLazyContentModel lazyData) {
    momentHomeData!.post.addAll(lazyData.post);
    momentHomeData!.user.addAll(lazyData.user);
    momentHomeData!.postgroup.addAll(lazyData.group);
    notifyListeners();
  }

  toggleLike(int postIndex) {
    momentHomeData!.post[postIndex].likestatus =
        !(momentHomeData!.post[postIndex].likestatus);
    momentHomeData!.post[postIndex].likestatus
        ? momentHomeData!.post[postIndex].likecount++
        : momentHomeData!.post[postIndex].likecount--;
    notifyListeners();
  }

  addComment(int postIndex, String comment) async {
    momentHomeData!.post[postIndex].commentdata.insert(0, comment);
    momentHomeData!.post[postIndex].commentedby
        .insert(0, momentHomeData!.username);
    momentHomeData!.post[postIndex].dp.insert(0, momentHomeData!.userdp);
    momentHomeData!.post[postIndex].commentcount++;
    notifyListeners();
  }

  setTutor(int tutorId) {
    momentHomeData!.tutor = momentHomeData!.staffdetails
        .firstWhere((staff) => staff.userid == tutorId);
    notifyListeners();
  }
}
