import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/moment/post_card.dart';
import 'package:moment/models/network_response_model.dart';
import 'package:moment/providers/home_page_provider.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:provider/provider.dart';
import 'package:moment/services.dart' as services;
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/utils/prefs.dart' as prefs;

class MomentHome extends StatefulWidget {
  const MomentHome({Key? key}) : super(key: key);

  @override
  _MomentHomeState createState() => _MomentHomeState();
}

class _MomentHomeState extends State<MomentHome> {
  bool isLoading = true, moreLoading = false;
  int currentPostIndex = 0;
  String localDocPath = '';
  ScrollController scrollController = ScrollController();

  Future<void> getContent() async {
    setState(() {
      isLoading = true;
    });
    localDocPath = await prefs.getString('localDocPath');
    NetworkResponseModel responseData = await services.getHomeInitContent();
    switch (responseData.status) {
      case 1:
        Provider.of<MomentHomeNotifier>(context, listen: false)
            .setHomeData(responseData.data);
        Provider.of<HomePageNotifier>(context, listen: false).contentLoaded();
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
    setState(() {
      moreLoading = true;
    });
    NetworkResponseModel responseData =
        await services.getHomeLazyContent(currentPostIndex);
    switch (responseData.status) {
      case 2:
        Provider.of<MomentHomeNotifier>(context, listen: false)
            .extendHomeData(responseData.data);
        print(responseData.data.post.length);
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
    if (!moreLoading &&
        scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
      print('Load More Triggered $currentPostIndex');
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
        ? const Center(
            child: SizedBox(
              width: 120,
              child: LinearProgressIndicator(),
            ),
          )
        : RefreshIndicator(
            onRefresh: getContent,
            child: Consumer<MomentHomeNotifier>(builder: (BuildContext context,
                MomentHomeNotifier momentHomeState, Widget? child) {
              if (momentHomeState.momentHomeData == null ||
                  momentHomeState.momentHomeData?.length == 0) {
                return CustomScrollConfig(
                  child: ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.warning_amber_outlined,
                                  size: 32,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Text(
                                  'Unable to fetch data!',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return CustomScrollConfig(
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            if (index ==
                                momentHomeState.momentHomeData?.post.length) {
                              return moreLoading
                                  ? const Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: SizedBox(
                                          width: 120,
                                          child: LinearProgressIndicator(),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(
                                      height: 160,
                                    );
                            }
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                              child: PostCard(
                                postInfo:
                                    momentHomeState.momentHomeData!.post[index],
                                postedByInfo:
                                    momentHomeState.momentHomeData!.user[index],
                                postedGroupInfo: momentHomeState
                                    .momentHomeData!.postgroup[index],
                                postIndex: index,
                                likeStatus: momentHomeState
                                    .momentHomeData!.post[index].likestatus,
                                localDocPath: localDocPath,
                                elevation: 3,
                                isHome: true,
                              ),
                            );
                          },
                          childCount:
                              momentHomeState.momentHomeData!.post.length + 1,
                        ),
                      ),
                    ],
                  ),
                );
              }
            }),
          );
  }
}
