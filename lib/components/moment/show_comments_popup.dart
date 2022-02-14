import 'package:flutter/material.dart';
import 'package:moment/screens/moment/comments_screen.dart';

showComments(
    BuildContext context,
    String grpdpUrl,
    String groupName,
    String tutorName,
    int batchNum,
    String postMsg,
    String? imageUrl,
    int noOfLikes,
    int noOfComments) {
  return StatefulBuilder(
    builder: (context, setState) {
      return AlertDialog(
        insetPadding: EdgeInsets.symmetric(vertical: 100, horizontal: 30),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                IconData(0xf572,
                    fontFamily: 'MaterialIcons', matchTextDirection: true),
                color: Colors.black,
              ),
              onPressed: () {
                setState(
                  () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
            Text("Comments"),
          ],
        ),
        content: SingleChildScrollView(
          child: Column(
            children: const [
              Comments(
                dpUrl:
                    'https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=',
                commentMsg: 'will attendance be taken sir!',
                userName: '19F022 - Kishore L',
              ),
              Comments(
                dpUrl:
                    'https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=',
                commentMsg: 'will attendance be taken sir!',
                userName: '19F022 - Kishore L',
              ),
              Comments(
                dpUrl:
                    'https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=',
                commentMsg: 'ok sir',
                userName: '19F022 - Kishore L',
              ),
            ],
          ),
        ),
        actions: [
          MaterialButton(
            child: const Text(
              "Show more",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 18,
              ),
            ),
            onPressed: () {
              setState(
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CommentsScreen(
                        grpdpUrl: grpdpUrl,
                        groupName: groupName,
                        batchNum: batchNum,
                        postMsg: postMsg,
                        tutorName: tutorName,
                        imageUrl: imageUrl!,
                        noOfLikes: noOfLikes,
                        noOfComments: noOfComments,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      );
    },
  );
}

class Comments extends StatefulWidget {
  final String dpUrl;
  final String userName;
  final String commentMsg;

  const Comments({
    Key? key,
    required this.dpUrl,
    required this.userName,
    required this.commentMsg,
  }) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(widget.dpUrl),
                ),
              ),
              Expanded(
                child: Text(
                  widget.userName + " : " + widget.commentMsg,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// TODO
// RichText(
//                   text: TextSpan(
//                     text: widget.userName + " : ",
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                     ),
//                     children: [
//                       TextSpan(
//                         text: widget.commentMsg,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.normal,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),