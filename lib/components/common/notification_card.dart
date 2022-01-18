import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String dpUrl;
  final String userName;
  final String notificationMsg;
  final String? imageUrl;
  final bool isNew;

  const NotificationCard({
    Key? key,
    required this.dpUrl,
    required this.userName,
    required this.notificationMsg,
    required this.isNew,
    this.imageUrl,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Card(
        color: isNew ? Colors.white : Color(0xFFEDF6FD),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10)),
        elevation: 8,
        child: Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(dpUrl),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: RichText(
                          text: TextSpan(
                            text: userName + "  ",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: notificationMsg,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    if (imageUrl != null)
                      Image(
                        height: 50,
                        width: 50,
                        image: NetworkImage(imageUrl!),
                      ),
                  ],
                ),
                Text(
                  "show more",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
