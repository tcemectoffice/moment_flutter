import 'package:flutter/material.dart';
import 'package:moment/components/common/circle_image.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/moment/post_card.dart';
import 'package:moment/services.dart' as services;
import 'package:moment/utils/util_functions.dart' as utils;

class MomentHome extends StatefulWidget {
  const MomentHome({Key? key}) : super(key: key);

  @override
  _MomentHomeState createState() => _MomentHomeState();
}

class _MomentHomeState extends State<MomentHome> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    services.getHomeInitContent().then((value) {
      switch (value) {
        case 1:
          break;
        case 0:
          utils.showSnackMessage(context, 'Invalid Login Credentials');
          break;
        case 2:
          utils.showSnackMessage(context, 'Invalid Access');
          break;
        case 3:
          utils.showSnackMessage(
              context, 'Unknown error occured! Try again later!');
          break;
        case 4:
          utils.showSnackMessage(context, 'No Internet! Try again later!');
          break;
        default:
          utils.showSnackMessage(
              context, 'Unknown error occured! Try again later!');
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollConfig(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Groups',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 90,
                            width: 90,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                CircleImage(
                                  isAsset: true,
                                  imgUrl: 'assets/images/tce_logo.png',
                                  radius: 60.0,
                                  addPadding: false,
                                ),
                                Text(
                                  'MECT - General',
                                  style: TextStyle(fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 90,
                            width: 90,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                CircleImage(
                                  isAsset: true,
                                  imgUrl: 'assets/images/tutor_ward.jpeg',
                                  radius: 60.0,
                                  addPadding: false,
                                ),
                                Text(
                                  'Tutor Ward',
                                  style: TextStyle(fontSize: 12.0),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Posts',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: PostCard(
                    grpdpUrl: "assets/images/tce_logo.png",
                    groupName: "Tutor Ward",
                    tutorName: "Mr.S.Partha sarathi",
                    batchNum: 1,
                    postMsg:
                        "All Students of batch 2 are asked to join the tutor ward meeting by 8pm today",
                    imageUrl: "assets/images/tutor_ward.jpeg",
                  ),
                );
              },
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
