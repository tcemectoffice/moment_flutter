import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/moment/comment_input.dart';
import 'package:moment/components/moment/comment_tile.dart';
import 'package:moment/components/moment/post_card.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:provider/provider.dart';
import 'package:moment/services.dart' as services;
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/utils/prefs.dart' as prefs;

class PostScreen extends StatefulWidget {
  final int? postIndex;
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
  late int? index;
  bool isLoading = true;
  String localDocPath = '';
  final TextEditingController commentController = TextEditingController();
  final FocusNode commentNode = FocusNode();

  initialize() async {
    setState(() {
      isLoading = true;
    });
    index = widget.postIndex;
    localDocPath = await prefs.getString('localDocPath');
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  void dispose() {
    commentController.dispose();
    commentNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: isLoading
            ? const Center(
                child: SizedBox(
                  width: 120,
                  child: LinearProgressIndicator(),
                ),
              )
            : Consumer<MomentHomeNotifier>(builder: (BuildContext context,
                MomentHomeNotifier postState, Widget? child) {
                onNewComment() async {
                  if (commentController.text.isNotEmpty) {
                    bool postComment = await services.postComment(
                        postState.momentHomeData!.post[index!].postid,
                        commentController.text);
                    if (postComment) {
                      postState.addComment(index!, commentController.text);
                      commentController.clear();
                    } else {
                      utils.showSnackMessage(
                          context, 'Something went wrong! Try again!');
                    }
                  } else {
                    utils.showSnackMessage(context, "Comments can't be empty!");
                  }
                }

                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  child: CustomScrollConfig(
                    child: CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: PostCard(
                            postInfo: postState.momentHomeData!.post[index!],
                            postedByInfo:
                                postState.momentHomeData!.user[index!],
                            postedGroupInfo:
                                postState.momentHomeData!.postgroup[index!],
                            postIndex: index!,
                            likeStatus: postState
                                .momentHomeData!.post[index!].likestatus,
                            elevation: 0,
                            localDocPath: localDocPath,
                            commentAction: () {
                              commentNode.requestFocus();
                            },
                            isHome: true,
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
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                primary: false,
                                itemCount: postState.momentHomeData!
                                        .post[index!].commentcount +
                                    1,
                                itemBuilder:
                                    (BuildContext context, int commentIndex) {
                                  if (commentIndex == 0) {
                                    return Column(
                                      children: [
                                        CommentInput(
                                          controller: commentController,
                                          node: commentNode,
                                          dpUrl:
                                              postState.momentHomeData!.userdp,
                                          autoFocus: widget.source == 'comment',
                                          onNewComment: onNewComment,
                                        ),
                                        if (commentIndex !=
                                            postState.momentHomeData!
                                                .post[index!].commentcount)
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
                                        dpUrl: postState.momentHomeData!
                                            .post[index!].dp[commentIndex - 1],
                                        commentMsg: postState
                                            .momentHomeData!
                                            .post[index!]
                                            .commentdata[commentIndex - 1],
                                        userName: postState
                                            .momentHomeData!
                                            .post[index!]
                                            .commentedby[commentIndex - 1],
                                      ),
                                      if (commentIndex !=
                                          postState.momentHomeData!.post[index!]
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
