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
    momentHomeData!.group.addAll(lazyData.group);
  }

  toggleLike(int postIndex) {
    momentHomeData!.post[postIndex].likestatus =
        momentHomeData!.post[postIndex].likestatus;
  }
}
