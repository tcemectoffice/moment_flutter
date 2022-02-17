import 'package:flutter/material.dart';
import 'package:moment/components/common/server_image.dart';
import 'package:moment/models/group_model.dart';
import 'package:moment/models/post_model.dart';
import 'package:moment/models/user_model.dart';
import 'package:moment/screens/moment/post_screen.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/services.dart' as services;
import 'package:provider/provider.dart';

class PostCard extends StatefulWidget {
  final Post postInfo;
  final User postedByInfo;
  final Group postedGroupInfo;
  final int postIndex;
  final bool likeStatus;
  final double elevation;
  final Function? commentAction;

  const PostCard({
    Key? key,
    required this.postInfo,
    required this.postedByInfo,
    required this.postedGroupInfo,
    required this.postIndex,
    required this.likeStatus,
    required this.elevation,
    this.commentAction,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late bool likeStatus;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    likeStatus = widget.likeStatus;
    likeCount = widget.postInfo.likecount;
  }

  onLikePressed() async {
    bool likePost =
        await services.postLike(widget.postInfo.postid, !likeStatus);
    if (likePost) {
      Provider.of<MomentHomeNotifier>(context, listen: false)
          .toggleLike(widget.postIndex);
      setState(() {
        likeStatus = !likeStatus;
        likeStatus ? likeCount++ : likeCount--;
      });
    } else {
      utils.showSnackMessage(context, 'Something went wrong! Try again!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10)),
      elevation: widget.elevation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: Colors.transparent,
              backgroundImage: serverImage(widget.postedGroupInfo.groupdp),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.postedGroupInfo.groupname,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      widget.postedByInfo.name,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.0),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      widget.postInfo.postdata,
                      style: const TextStyle(fontSize: 16),
                    ),
                    (widget.postInfo.isimage &&
                            widget.postInfo.filedetails != null)
                        ? Padding(
                            padding: const EdgeInsets.only(top: 14, bottom: 8),
                            child: Center(
                              child: Image(
                                height: 300,
                                fit: BoxFit.contain,
                                image: serverImage(
                                    widget.postInfo.filedetails![0].fileurl),
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 16,
                          ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: onLikePressed,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(likeStatus
                                      ? Icons.thumb_up
                                      : Icons.thumb_up_outlined),
                                ),
                                Text(
                                  likeCount.toString(),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 36,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (widget.commentAction == null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PostScreen(
                                      postIndex: widget.postIndex,
                                      source: 'comment',
                                    ),
                                  ),
                                );
                              } else {
                                widget.commentAction!();
                              }
                            },
                            child: Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.message_outlined),
                                ),
                                Text(
                                  widget.postInfo.commentcount.toString(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
