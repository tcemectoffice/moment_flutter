import 'package:flutter/material.dart';
import 'package:moment/components/common/server_image.dart';
import 'package:moment/screens/moment/post_screen.dart';

class NotificationCard extends StatelessWidget {
  final int postId;
  final String userName;
  final String dpUrl;
  final String groupName;
  final String notificationMsg;
  final String? imageUrl;
  final bool isNew;

  const NotificationCard({
    Key? key,
    required this.postId,
    required this.dpUrl,
    required this.userName,
    required this.groupName,
    required this.notificationMsg,
    required this.isNew,
    this.imageUrl,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((BuildContext context) =>
                PostScreen(postId: postId, source: 'notifications')),
          ),
        );
      },
      child: Card(
        color: isNew ? Colors.white : const Color(0xFFEDF6FD),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.fromLTRB(isNew ? 10 : 12, 12, 12, 12),
          child: Row(
            children: [
              if (isNew)
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 6,
                      width: 6,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: CircleAvatar(
                  radius: 21,
                  backgroundImage: serverImageProvider(dpUrl),
                ),
              ),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    text: userName + " ",
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: notificationMsg,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: " " + groupName,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (imageUrl != null)
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Image(
                    height: 48,
                    width: 48,
                    image: serverImageProvider(imageUrl!),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
