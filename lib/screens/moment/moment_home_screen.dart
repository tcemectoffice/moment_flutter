import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/moment/post_card.dart';
import 'package:moment/models/network_response_model.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:moment/providers/staff_provider.dart';
import 'package:moment/services.dart' as services;
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:provider/provider.dart';

class MomentHome extends StatefulWidget {
  const MomentHome({Key? key}) : super(key: key);

  @override
  _MomentHomeState createState() => _MomentHomeState();
}

class _MomentHomeState extends State<MomentHome> {
  bool isLoading = true, moreLoading = true;
  int currentPostIndex = 0;
  ScrollController scrollController = ScrollController();

  Future<void> getContent() async {
    setState(() {
      isLoading = true;
    });
    NetworkResponseModel responseData = await services.getHomeInitContent();
    switch (responseData.status) {
      case 1:
        Provider.of<MomentHomeNotifier>(context, listen: false)
            .setHomeData(responseData.data);
        Provider.of<StaffNotifier>(context, listen: false)
            .setStaffDetails(responseData.data.staffdetails);
        currentPostIndex = 10;
        break;
      case 999:
        utils.showSnackMessage(
            context, 'Unknown error occured! Try again later!');
        break;
      case 1000:
        utils.showSnackMessage(context, 'No Internet! Try again later!');
        break;
      default:
        utils.showSnackMessage(
            context, 'Unknown error occured! Try again later!');
    }
    setState(() {
      isLoading = false;
    });
  }

  loadMore() async {
    NetworkResponseModel responseData =
        await services.getHomeLazyContent(currentPostIndex);
    switch (responseData.status) {
      case 2:
        Provider.of<MomentHomeNotifier>(context, listen: false)
            .extendHomeData(responseData.data);
        currentPostIndex += responseData.data.post.length as int;
        break;
      case 999:
        utils.showSnackMessage(
            context, 'Unknown error occured! Try again later!');
        break;
      case 1000:
        utils.showSnackMessage(context, 'No Internet! Try again later!');
        break;
      default:
        utils.showSnackMessage(
            context, 'Unknown error occured! Try again later!');
    }
    setState(() {
      moreLoading = false;
    });
  }

  void scrollListener() async {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      print('Load More Triggered');
      setState(() {
        moreLoading = true;
      });
      await loadMore();
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    currentPostIndex = 0;
    getContent();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : RefreshIndicator(
            onRefresh: getContent,
            child: Consumer<MomentHomeNotifier>(builder: (BuildContext context,
                MomentHomeNotifier momentHomeState, Widget? child) {
              return CustomScrollConfig(
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          if (index == momentHomeState.momentHomeData!.length) {
                            return moreLoading
                                ? const Center(
                                    child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: CircularProgressIndicator(),
                                  ))
                                : const SizedBox(
                                    height: 30,
                                  );
                          }
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 15.0),
                            child: PostCard(
                              postInfo:
                                  momentHomeState.momentHomeData!.post[index],
                              postedByInfo:
                                  momentHomeState.momentHomeData!.user[index],
                              postedGroupInfo:
                                  momentHomeState.momentHomeData!.group[index],
                              postIndex: index,
                              likeStatus: momentHomeState
                                  .momentHomeData!.post[index].likestatus,
                              elevation: 8,
                            ),
                          );
                        },
                        childCount: momentHomeState.momentHomeData!.length + 1,
                      ),
                    ),
                  ],
                ),
              );
            }),
          );
  }
}
