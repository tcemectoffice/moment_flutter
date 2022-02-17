import 'package:flutter/material.dart';
import 'package:moment/components/common/notification_card.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          titleTextStyle: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w600,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: const Text("Notifications"),
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Mark all as read",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        backgroundColor: const Color(0xFFDAEDFB),
        body: CustomScrollConfig(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 12),
                      child: index - 1 < 1
                          ? const NotificationCard(
                              imageUrl:
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUK1LaBaummJfuW6GIM_kt3R9egIlpqVpEKw&usqp=CAU",
                              dpUrl:
                                  "https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=",
                              notificationMsg: "has commented on your post.",
                              userName: "Kishore L",
                              isNew: true,
                            )
                          : const NotificationCard(
                              dpUrl:
                                  "https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=",
                              notificationMsg: "has commented on your post.",
                              userName: "Kishore L",
                              isNew: false,
                            ),
                    );
                  },
                  childCount: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
