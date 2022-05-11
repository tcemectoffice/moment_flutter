import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart'
    show SelectableLinkify, LinkifyOptions, LinkableElement;
import 'package:moment/components/common/custom_popup.dart';
import 'package:moment/models/phone_number_linker.dart';
import 'package:moment/models/email_linker.dart';
import 'package:moment/models/single_post_data_model.dart';
import 'package:moment/models/url_linker.dart';
import 'package:moment/providers/home_page_provider.dart';
import 'package:open_file/open_file.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:moment/providers/group_screen_provider.dart';
import 'package:moment/providers/moment_home_provider.dart';
import 'package:moment/components/common/server_image.dart';
import 'package:moment/models/file_details_model.dart';
import 'package:moment/models/group_model.dart';
import 'package:moment/models/post_model.dart';
import 'package:moment/models/user_model.dart';
import 'package:moment/screens/moment/post_screen.dart';
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/services.dart' as services;
import 'package:url_launcher/url_launcher_string.dart';

class PostCard extends StatefulWidget {
  final Post postInfo;
  final User postedByInfo;
  final Group postedGroupInfo;
  final int postIndex;
  final bool likeStatus;
  final double elevation;
  final String localDocPath;
  final String source;
  final Function? commentAction;

  const PostCard({
    Key? key,
    required this.postInfo,
    required this.postedByInfo,
    required this.postedGroupInfo,
    required this.postIndex,
    required this.likeStatus,
    required this.elevation,
    required this.localDocPath,
    required this.source,
    this.commentAction,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  late bool likeStatus;
  late int likeCount, index;
  late List<Filedetails> fileDetails;
  late String localDocPath, source;
  bool isLoading = true;

  initialize() async {
    setState(() {
      isLoading = true;
    });
    likeStatus = widget.likeStatus;
    index = widget.postIndex;
    source = widget.source;
    likeCount = widget.postInfo.likecount;
    fileDetails = widget.postInfo.filedetails ?? [];
    localDocPath = widget.localDocPath;
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> onOpen(LinkableElement link) async {
    try {
      await launchUrlString(link.url, mode: LaunchMode.externalApplication);
    } catch (e) {
      throw 'Could not launch $link';
    }
  }

  onLikePressed() async {
    bool likePost =
        await services.postLike(widget.postInfo.postid, !likeStatus);
    if (likePost) {
      if (source == 'home') {
        Provider.of<MomentHomeNotifier>(context, listen: false)
            .toggleLike(widget.postIndex);
      } else if (source == 'groups') {
        Provider.of<GroupScreenNotifier>(context, listen: false)
            .toggleLike(widget.postIndex);
      }
      setState(() {
        likeStatus = !likeStatus;
        likeStatus ? likeCount++ : likeCount--;
      });
    } else {
      utils.showSnackMessage(context, 'Something went wrong! Try again!');
    }
  }

  downloadFile(Filedetails targetFile, int postId) async {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => const CustomPopup(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    String filePath = localDocPath + '/' + targetFile.filename;
    bool res = await services.downloadFile(targetFile, filePath);
    if (res) {
      if (source == 'home') {
        Provider.of<MomentHomeNotifier>(context, listen: false)
            .toggleFileStatus(widget.postInfo.postid, targetFile.filename);
      } else if (source == 'groups') {
        Provider.of<GroupScreenNotifier>(context, listen: false)
            .toggleFileStatus(widget.postInfo.postid, targetFile.filename);
      }
      setState(() {
        fileDetails
            .firstWhere((file) => file.filename == targetFile.filename)
            .fileDownloaded = true;
      });
    } else {
      utils.showSnackMessage(context, 'Download failed! Try Again...');
    }
    Navigator.of(context).pop(false);
    openFile(targetFile);
  }

  openFile(Filedetails file) {
    OpenFile.open('$localDocPath/${file.filename}', type: file.filetype);
  }

  checkFileExists(Filedetails file) {
    if (!file.fileDownloaded) {
      var res = File(localDocPath + '/' + file.filename).existsSync();
      if (res) {
        if (source == 'home') {
          Provider.of<MomentHomeNotifier>(context, listen: false)
              .toggleFileStatus(widget.postInfo.postid, file.filename);
        } else if (source == 'groups') {
          Provider.of<GroupScreenNotifier>(context, listen: false)
              .toggleFileStatus(widget.postInfo.postid, file.filename);
        }
        setState(() {
          fileDetails
              .firstWhere(
                  (fileFromList) => fileFromList.filename == file.filename)
              .fileDownloaded = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10)),
      elevation: widget.elevation,
      child: isLoading
          ? Container()
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        serverImageProvider(widget.postedGroupInfo.groupdp),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 4.0),
                            child: Text(
                              widget.postedGroupInfo.groupname,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
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
                          SelectableLinkify(
                            linkifiers: const [
                              PhoneLinkifier(),
                              EmailLinkifier(),
                              UrlLinkifier(),
                            ],
                            options: const LinkifyOptions(looseUrl: true),
                            onOpen: onOpen,
                            text: widget.postInfo.postdata,
                            style: const TextStyle(fontSize: 16),
                          ),
                          if (fileDetails.isNotEmpty)
                            Column(
                                children: fileDetails.map<Widget>((file) {
                              WidgetsBinding.instance
                                  ?.addPostFrameCallback((_) {
                                checkFileExists(file);
                              });
                              return file.isimage
                                  ? GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            barrierDismissible: false,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return BackdropFilter(
                                                filter: ImageFilter.blur(
                                                    sigmaX: 10, sigmaY: 10),
                                                child: Dialog(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      Colors.transparent,
                                                  child: PhotoView(
                                                    backgroundDecoration:
                                                        const BoxDecoration(
                                                      color: Colors.transparent,
                                                    ),
                                                    imageProvider:
                                                        serverImageProvider(
                                                            file.fileurl),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 14, bottom: 8),
                                        child: Center(
                                          child: ConstrainedBox(
                                            constraints: BoxConstraints(
                                              maxHeight: 240,
                                              maxWidth: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.67,
                                            ),
                                            child: Image(
                                              fit: BoxFit.contain,
                                              image: serverImageProvider(
                                                  file.fileurl),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.only(
                                          top: 14, bottom: 8),
                                      child: GestureDetector(
                                        onTap: file.fileDownloaded
                                            ? () {
                                                openFile(file);
                                              }
                                            : () async {
                                                await downloadFile(
                                                  file,
                                                  widget.postInfo.postid,
                                                );
                                              },
                                        child: Card(
                                          color: const Color.fromARGB(
                                              255, 216, 216, 216),
                                          child: Container(
                                            height: 60,
                                            width: 250,
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        width: 135,
                                                        child: Text(
                                                          file.filename,
                                                          style:
                                                              const TextStyle(
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 70,
                                                        child: Text(
                                                          '(${file.filesize})',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  if (!file.fileDownloaded)
                                                    const Icon(
                                                      Icons.download_outlined,
                                                    ),
                                                ]),
                                          ),
                                        ),
                                      ),
                                    );
                            }).toList()),
                          if (fileDetails.isEmpty)
                            const SizedBox(
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
                                      if (widget.source == 'home')
                                        Consumer<MomentHomeNotifier>(builder:
                                            ((context, homeState, child) {
                                          return Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Icon(homeState
                                                        .momentHomeData!
                                                        .post[index]
                                                        .likestatus
                                                    ? Icons.thumb_up
                                                    : Icons.thumb_up_outlined),
                                              ),
                                              Text(
                                                homeState.momentHomeData!
                                                    .post[index].likecount
                                                    .toString(),
                                              ),
                                            ],
                                          );
                                        })),
                                      if (widget.source == 'groups')
                                        Consumer<GroupScreenNotifier>(builder:
                                            ((context, groupState, child) {
                                          return Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8.0),
                                                child: Icon(groupState
                                                        .groupScreenData!
                                                        .post[index]
                                                        .likestatus
                                                    ? Icons.thumb_up
                                                    : Icons.thumb_up_outlined),
                                              ),
                                              Text(
                                                groupState.groupScreenData!
                                                    .post[index].likecount
                                                    .toString(),
                                              ),
                                            ],
                                          );
                                        })),
                                      if (widget.source == 'notifications')
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Icon(likeStatus
                                                  ? Icons.thumb_up
                                                  : Icons.thumb_up_outlined),
                                            ),
                                            Text(
                                              likeCount.toString(),
                                            ),
                                          ],
                                        )
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
                                            post: SinglePostDataModel(
                                              post: widget.postInfo,
                                              user: widget.postedByInfo,
                                              group: widget.postedGroupInfo,
                                            ),
                                            source: widget.source,
                                            postIndex: widget.postIndex,
                                            action: 'comment',
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
