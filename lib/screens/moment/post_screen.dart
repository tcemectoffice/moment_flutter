import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/moment/comment_input.dart';
import 'package:moment/components/moment/comment_tile.dart';
import 'package:moment/components/moment/post_card.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  final int postIndex;
  final String source;

  const PostScreen({
    Key? key,
    required this.postIndex,
    required this.source,
  }) : super(key: key);

  @override
  State<PostScreen> createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  late int index;
  final TextEditingController commentController = TextEditingController();
  final FocusNode commentNode = FocusNode();

  @override
  void initState() {
    super.initState();
    index = widget.postIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Consumer<MomentHomeNotifier>(builder: (BuildContext context,
            MomentHomeNotifier postState, Widget? child) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: CustomScrollConfig(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: PostCard(
                      postInfo: postState.momentHomeData!.post[index],
                      postedByInfo: postState.momentHomeData!.user[index],
                      postedGroupInfo: postState.momentHomeData!.group[index],
                      postIndex: index,
                      likeStatus:
                          postState.momentHomeData!.post[index].likestatus,
                      elevation: 0,
                      commentAction: () {
                        commentNode.requestFocus();
                      },
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 15, 8, 8),
                      child: Text(
                        "Comments",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          itemBuilder:
                              (BuildContext context, int commentIndex) {
                            if (commentIndex == 0) {
                              return Column(
                                children: [
                                  CommentInput(
                                    controller: commentController,
                                    node: commentNode,
                                    dpUrl: postState.momentHomeData!.userdp,
                                    autoFocus: widget.source == 'comment',
                                  ),
                                  if (commentIndex !=
                                      postState.momentHomeData!.post[index]
                                          .commentcount)
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: Divider(
                                        thickness: 1,
                                      ),
                                    ),
                                ],
                              );
                            }
                            return Column(
                              children: [
                                CommentTile(
                                  dpUrl: postState.momentHomeData!.post[index]
                                      .dp[commentIndex - 1],
                                  commentMsg: postState
                                      .momentHomeData!
                                      .post[index]
                                      .commentdata[commentIndex - 1],
                                  userName: postState
                                      .momentHomeData!
                                      .post[index]
                                      .commentedby[commentIndex - 1],
                                ),
                                if (commentIndex !=
                                    postState.momentHomeData!.post[index]
                                        .commentcount)
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    child: Divider(
                                      thickness: 1,
                                    ),
                                  ),
                              ],
                            );
                          },
                          itemCount: postState
                                  .momentHomeData!.post[index].commentcount +
                              1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
