import 'package:flutter/material.dart';
import 'package:moment/components/common/notification_card.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/models/network_response_model.dart';
import 'package:moment/models/notification_model.dart';
import 'package:moment/utils/util_functions.dart';
import 'package:moment/utils/util_functions.dart' as utils;
import 'package:moment/services.dart' as services;

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late List<NotificationModel> notificationData = [];
  bool isLoading = true;

  loadContent() async {
    setState(() {
      isLoading = true;
    });
    NetworkResponseModel responseData = await services.getNotificationsList();
    switch (responseData.status) {
      case 6:
        setState(() {
          notificationData = responseData.data.content;
        });
        break;
      case 999:
        utils.showSnackMessage(
            context, 'Unknown error occured! Try again later!');
        break;
      case 1000:
        utils.showSnackMessage(context, 'No Internet! Try again later!');
        break;
      default:
        utils.showSnackMessage(
            context, 'Unknown error occured! Try again later!');
    }
    setState(() {
      isLoading = false;
    });
    print(notificationData.length);
  }

  @override
  void initState() {
    super.initState();
    loadContent();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          title: const Text("Notifications"),
        ),
        backgroundColor: const Color(0xFFDAEDFB),
        body: isLoading
            ? const Center(
                child: SizedBox(width: 120, child: LinearProgressIndicator()),
              )
            : Container(
                margin: getScreenMargins(context),
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: CustomScrollConfig(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                              padding: const EdgeInsets.fromLTRB(6, 8, 6, 0),
                              child: NotificationCard(
                                postId: notificationData[index].postid,
                                dpUrl: notificationData[index].dp,
                                userName: notificationData[index].name,
                                notificationMsg:
                                    notificationData[index].notificationContent,
                                groupName: notificationData[index].gname,
                                imageUrl: notificationData[index].fileurl,
                                isNew: notificationData[index].isnew,
                              ),
                            );
                          },
                          childCount: notificationData.length,
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
