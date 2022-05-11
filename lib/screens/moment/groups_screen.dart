import 'package:flutter/material.dart';
import 'package:moment/components/common/bottom_navbar.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/common/moment_appbar.dart';
import 'package:moment/components/moment/add_post_card.dart';
import 'package:moment/components/moment/group_info_card.dart';
import 'package:moment/components/moment/post_card.dart';
import 'package:moment/models/group_model.dart';
import 'package:moment/models/network_response_model.dart';
import 'package:moment/providers/group_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:moment/services.dart' as services;
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/utils/prefs.dart' as prefs;

class Groups extends StatefulWidget {
  final int? groupId;
  const Groups({Key? key, this.groupId}) : super(key: key);

  @override
  State<Groups> createState() => _GroupsState();
}

class _GroupsState extends State<Groups> {
  late String userName, userDp;
  late int groupId;
  late Group group;
  bool isLoading = true, moreLoading = false;
  int currentPostIndex = 0;
  String localDocPath = '';
  ScrollController scrollController = ScrollController();

  Future<void> getContent() async {
    setState(() {
      isLoading = true;
    });
    groupId = widget.groupId ?? 0;
    if (groupId == 0) {
      var args = ModalRoute.of(context)!.settings.arguments as Group;
      groupId = args.groupid;
    }
    userName = await prefs.getString('userName');
    userDp = await prefs.getString('userDp');
    localDocPath = await prefs.getString('localDocPath');
    NetworkResponseModel responseData =
        await services.getGroupsInitContent(groupId);
    switch (responseData.status) {
      case 3:
        Provider.of<GroupScreenNotifier>(context, listen: false)
            .setGroupData(responseData.data);
        currentPostIndex = 10;
        group = responseData.data.groupinfo;
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
        await services.getGroupsLazyContent(currentPostIndex);
    switch (responseData.status) {
      case 2:
        Provider.of<GroupScreenNotifier>(context, listen: false)
            .extendGroupData(responseData.data);
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
      print('Load More Triggered');
      print(currentPostIndex);
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
    return Scaffold(
      appBar: const MomentAppBar(),
      bottomNavigationBar: const BottomNavBar(
        index: 1,
      ),
      body: Container(
        margin: utils.getScreenMargins(context),
        child: isLoading
            ? const Center(
                child: SizedBox(width: 120, child: LinearProgressIndicator()))
            : RefreshIndicator(
                onRefresh: getContent,
                child: CustomScrollConfig(
                  child: CustomScrollView(
                    controller: scrollController,
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: GroupInfoCard(group: group),
                            ),
                            AddPostCard(
                              userName: userName,
                              dpUrl: userDp,
                              groupId: group.groupid,
                              groupName: group.groupname,
                              primary: false,
                            ),
                          ],
                        ),
                      ),
                      Consumer<GroupScreenNotifier>(builder:
                          (BuildContext context,
                              GroupScreenNotifier groupScreenState,
                              Widget? child) {
                        if (groupScreenState.groupScreenData == null) {
                          return SliverToBoxAdapter(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
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
                          );
                        } else if (groupScreenState.groupScreenData?.length ==
                            0) {
                          return SliverToBoxAdapter(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
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
                                        'No data!',
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
                          );
                        } else {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                if (index ==
                                    groupScreenState
                                        .groupScreenData?.post.length) {
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
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 16, 8, 0),
                                  child: PostCard(
                                    postInfo: groupScreenState
                                        .groupScreenData!.post[index],
                                    postedByInfo: groupScreenState
                                        .groupScreenData!.user[index],
                                    postedGroupInfo: groupScreenState
                                        .groupScreenData!.group[index],
                                    postIndex: index,
                                    likeStatus: groupScreenState
                                        .groupScreenData!
                                        .post[index]
                                        .likestatus,
                                    localDocPath: localDocPath,
                                    elevation: 3,
                                    source: 'groups',
                                  ),
                                );
                              },
                              childCount: groupScreenState
                                      .groupScreenData!.post.length +
                                  1,
                            ),
                          );
                        }
                      }),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
