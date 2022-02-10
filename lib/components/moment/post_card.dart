import 'package:flutter/material.dart';
import 'show_comments_popup.dart';

class PostCard extends StatefulWidget {
  final String grpdpUrl;
  final String groupName;
  final String tutorName;
  final int batchNum;
  final String postMsg;
  final String? imageUrl;

  const PostCard({
    Key? key,
    required this.grpdpUrl,
    required this.groupName,
    required this.tutorName,
    required this.batchNum,
    required this.postMsg,
    this.imageUrl,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int noOfLikes = 0;

  int noOfComments = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10)),
        elevation: 8,
        child: Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 27,
                  backgroundImage: AssetImage(widget.grpdpUrl),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.groupName} - Batch ${widget.batchNum}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.tutorName,
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        Text(
                          widget.postMsg,
                          style: const TextStyle(fontSize: 16),
                        ),
                        if (widget.imageUrl != null)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Center(
                              child: Image(
                                height: 150,
                                width: 200,
                                image: AssetImage(widget.imageUrl!),
                              ),
                            ),
                          ),
                        Row(
                          children: [
                            const IconButton(
                              onPressed: null,
                              icon: Icon(Icons.thumb_up_sharp),
                            ),
                            Text(
                              "$noOfLikes",
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              icon: const Icon(Icons.message),
                              onPressed: () {
                                setState(() {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return showComments(
                                            context,
                                            widget.grpdpUrl,
                                            widget.groupName,
                                            widget.tutorName,
                                            widget.batchNum,
                                            widget.postMsg,
                                            widget.imageUrl!,
                                            noOfLikes,
                                            noOfComments);
                                      });
                                });
                              },
                            ),
                            Text(
                              "$noOfComments",
                            ),
                          ],
                        )
                      ],
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
