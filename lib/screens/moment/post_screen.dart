import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/moment/comment_input.dart';
import 'package:moment/components/moment/comment_tile.dart';
import 'package:moment/components/moment/post_card.dart';
import 'package:moment/models/network_response_model.dart';
import 'package:moment/models/single_post_data_model.dart';
import 'package:moment/providers/group_screen_provider.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:provider/provider.dart';
import 'package:moment/services.dart' as services;
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/utils/prefs.dart' as prefs;

class PostScreen extends StatefulWidget {
  final int? postId;
  final int? postIndex;
  final SinglePostDataModel? post;
  final String? action;
  final String source;

  const PostScreen({
    Key? key,
    required this.source,
    this.action,
    this.postId,
    this.postIndex,
    this.post,
  }) : super(key: key);

  @override
  State<PostScreen> createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  late int index;
  late String userName, userDp, localDocPath;
  late SinglePostDataModel postData;
  bool isLoading = true;
  final TextEditingController commentController = TextEditingController();
  final FocusNode commentNode = FocusNode();

  onNewComment() async {
    if (commentController.text.isNotEmpty) {
      bool postComment = await services.postComment(
          index == -1 ? widget.postId! : postData.post.postid,
          commentController.text);
      if (postComment) {
        if (widget.source == 'home') {
          Provider.of<MomentHomeNotifier>(context, listen: false)
              .addComment(index, commentController.text);
        } else if (widget.source == 'groups') {
          Provider.of<GroupScreenNotifier>(context, listen: false)
              .addComment(index, commentController.text);
        } else {
          setState(() {
            postData.post.commentdata.insert(0, commentController.text);
            postData.post.commentedby.insert(0, userName);
            postData.post.dp.insert(0, userDp);
            postData.post.commentcount++;
          });
        }
        setState(() {
          commentController.clear();
        });
      } else {
        utils.showSnackMessage(context, 'Something went wrong! Try again!');
      }
    } else {
      utils.showSnackMessage(context, "Comments can't be empty!");
    }
  }

  initialize() async {
    setState(() {
      isLoading = true;
    });
    int tempIndex = widget.postIndex ?? -1;
    String templocalDocPath = await prefs.getString('localDocPath');
    String tempUserDp = await prefs.getString('userDp');
    String tempUserName = await prefs.getString('userName');
    dynamic tempPostData;
    if (tempIndex == -1) {
      NetworkResponseModel responseData =
          await services.getPostSingle(widget.postId!);
      switch (responseData.status) {
        case 7:
          tempPostData = responseData.data;
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
    } else {
      tempPostData = widget.post;
    }
    setState(() {
      postData = tempPostData;
      index = tempIndex;
      localDocPath = templocalDocPath;
      userDp = tempUserDp;
      userName = tempUserName;
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
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: CustomScrollConfig(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: PostCard(
                          postInfo: postData.post,
                          postedByInfo: postData.user,
                          postedGroupInfo: postData.group,
                          postIndex: index,
                          likeStatus: postData.post.likestatus,
                          elevation: 0,
                          localDocPath: localDocPath,
                          commentAction: () {
                            commentNode.requestFocus();
                          },
                          source: widget.source,
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
                              itemCount: postData.post.commentcount + 1,
                              itemBuilder:
                                  (BuildContext context, int commentIndex) {
                                if (commentIndex == 0) {
                                  return Column(
                                    children: [
                                      CommentInput(
                                        controller: commentController,
                                        node: commentNode,
                                        dpUrl: userDp,
                                        autoFocus: widget.action == 'comment',
                                        onNewComment: onNewComment,
                                      ),
                                      if (commentIndex !=
                                          postData.post.commentcount)
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
                                      dpUrl: postData.post.dp[commentIndex - 1],
                                      commentMsg: postData
                                          .post.commentdata[commentIndex - 1],
                                      userName: postData
                                          .post.commentedby[commentIndex - 1],
                                    ),
                                    if (commentIndex !=
                                        postData.post.commentcount)
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
              ),
      ),
    );
  }
}
