import 'package:flutter/material.dart';
import 'package:moment/components/common/notification_card.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFDAEDFB),
        body: CustomScrollConfig(
          child: CustomScrollView(
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
                            child: Icon(
                              IconData(0xf572,
                                  fontFamily: 'MaterialIcons',
                                  matchTextDirection: true),
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
                    return index - 1 < 1
                        ? Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: const NotificationCard(
                              imageUrl:
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUK1LaBaummJfuW6GIM_kt3R9egIlpqVpEKw&usqp=CAU",
                              dpUrl:
                                  "https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=",
                              notificationMsg: "has commented on your post.",
                              userName: "Kishore L",
                              isNew: true,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: const NotificationCard(
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
