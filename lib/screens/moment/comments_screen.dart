import 'package:flutter/material.dart';
import 'package:moment/components/moment/show_comments_popup.dart';

class CommentsScreen extends StatefulWidget {
  final String grpdpUrl;
  final String groupName;
  final String tutorName;
  final int batchNum;
  final String postMsg;
  final String? imageUrl;
  final int noOfLikes;
  final int noOfComments;

  const CommentsScreen({
    Key? key,
    required this.grpdpUrl,
    required this.groupName,
    required this.tutorName,
    required this.batchNum,
    required this.postMsg,
    this.imageUrl,
    required this.noOfLikes,
    required this.noOfComments,
  }) : super(key: key);

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              IconData(
                0xf572,
                fontFamily: 'MaterialIcons',
                matchTextDirection: true,
              ),
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                Navigator.pop(context);
              });
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10)),
              elevation: 8,
              child: Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 27,
                            backgroundImage: NetworkImage(widget.grpdpUrl),
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                    color: Colors.black,
                                  ),
                                  Text(
                                    widget.postMsg,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                  if (widget.imageUrl != null)
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Image(
                                          height: 200,
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
                                        "${widget.noOfLikes}",
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      IconButton(
                                        icon: Icon(Icons.message),
                                        onPressed: null,
                                      ),
                                      Text(
                                        "${widget.noOfComments}",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    const Text(
                      "Comments",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const Comments(
                      dpUrl:
                          'https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=',
                      commentMsg: 'ok sir ',
                      userName: '19F022 - Kishore L',
                    ),
                    const Comments(
                      dpUrl:
                          'https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=',
                      commentMsg: 'will attendance be taken sir!',
                      userName: '19F022 - Kishore L',
                    ),
                    const Comments(
                      dpUrl:
                          'https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=',
                      commentMsg: 'is it compulsory for everyone to attend sir',
                      userName: '19F022 - Kishore L',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
