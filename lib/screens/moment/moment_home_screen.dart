import 'package:flutter/material.dart';
import 'package:moment/components/common/circle_image.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/moment/post_card.dart';

class MomentHome extends StatefulWidget {
  const MomentHome({Key? key}) : super(key: key);

  @override
  _MomentHomeState createState() => _MomentHomeState();
}

class _MomentHomeState extends State<MomentHome> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollConfig(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Groups',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 90,
                            width: 90,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
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
                          child: Container(
                            height: 90,
                            width: 90,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
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
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
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
                return const PostCard(
                  grpdpUrl:
                      "https://media.istockphoto.com/photos/colored-powder-explosion-on-black-background-picture-id1057506940?k=20&m=1057506940&s=612x612&w=0&h=3j5EA6YFVg3q-laNqTGtLxfCKVR3_o6gcVZZseNaWGk=",
                  groupName: "Tutor Ward",
                  tutorName: "Mr.S.Partha sarathi",
                  batchNum: 1,
                  postMsg:
                      "All Students of batch 2 are asked to join the tutor ward meeting by 8pm today",
                  imageUrl:
                      "https://vinusimages.co/wp-content/uploads/2018/10/EG7A2390.jpgA_.jpg",
                );
                ;
              },
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
