import 'package:flutter/material.dart';
import 'package:moment/components/common/server_image.dart';

// showComments(
//   BuildContext context,
//   int postIndex,
// ) {
//   return Consumer<MomentHomeNotifier>(
//     builder: (BuildContext context, MomentHomeNotifier momentHomeState,
//         Widget? child) {
//       return AlertDialog(
//         insetPadding: const EdgeInsets.symmetric(vertical: 100, horizontal: 30),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         title: Row(
//           children: [
//             IconButton(
//               icon: const Icon(
//                 Icons.arrow_back,
//               ),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             const Text("Comments"),
//           ],
//         ),
//         content: SingleChildScrollView(
//           child: Column(
//             children: [
//               Comments(
//                 dpUrl:
//                     'https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=',
//                 commentMsg: 'will attendance be taken sir!',
//                 userName: '19F022 - Kishore L',
//               ),
//               Comments(
//                 dpUrl:
//                     'https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=',
//                 commentMsg: 'will attendance be taken sir!',
//                 userName: '19F022 - Kishore L',
//               ),
//               Comments(
//                 dpUrl:
//                     'https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=',
//                 commentMsg: 'is it compulsory for everyone to attend sir',
//                 userName: '19F022 - Kishore L',
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           MaterialButton(
//             child: Text(
//               "Show more",
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontSize: 18,
//               ),
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => PostScreen(
//                     postIndex: postIndex,
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       );
//     },
//   );
// }

class CommentTile extends StatelessWidget {
  final String dpUrl;
  final String userName;
  final String commentMsg;

  const CommentTile({
    Key? key,
    required this.dpUrl,
    required this.userName,
    required this.commentMsg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: serverImage(dpUrl),
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: userName + " : ",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).textTheme.bodyMedium!.color),
                children: [
                  TextSpan(
                    text: commentMsg,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
