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
    return Card(
      color: isNew ? Colors.white : const Color(0xFFEDF6FD),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: CircleAvatar(
                radius: 21,
                backgroundImage: NetworkImage(dpUrl),
              ),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: userName + "  ",
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
                  image: NetworkImage(imageUrl!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
