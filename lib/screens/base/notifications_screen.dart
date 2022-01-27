import 'package:flutter/material.dart';
import 'package:moment/components/common/notification_card.dart';

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
        backgroundColor: const Color(0xFFDAEDFB),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: 30, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4),
                          child: IconButton(
                            onPressed: null,
                            icon: Icon(
                              IconData(
                                0xf572,
                                fontFamily: 'MaterialIcons',
                                matchTextDirection: true,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "Notifications",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    const Text(
                      "Mark all as read",
                      style: TextStyle(fontSize: 20, color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return const NotificationCard(
                      dpUrl:
                          "https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=",
                      userName: "Kishore L",
                      notificationMsg: "has posted a comment",
                      isNew: true);
                },
                childCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
