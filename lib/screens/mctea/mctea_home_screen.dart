import 'package:flutter/material.dart';
import 'package:moment/components/common/circle_image.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/mctea/category_card.dart';

class McteaHome extends StatefulWidget {
  const McteaHome({Key? key}) : super(key: key);

  @override
  _McteaHomeState createState() => _McteaHomeState();
}

class _McteaHomeState extends State<McteaHome> {
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
                    'Updates',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    height: 120,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      itemExtent: 100,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 90,
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
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 90,
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
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 90,
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
                        GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 90,
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
                      'Events',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 165,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      itemExtent: 200,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const CategoryCard(
                            title: 'Registrations Open',
                            bgIsAsset: true,
                            bgUrl: 'assets/images/reg_open.jpeg',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const CategoryCard(
                            title: 'Ongoing Events',
                            bgIsAsset: true,
                            bgUrl: 'assets/images/ongoing.jpeg',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const CategoryCard(
                            title: 'Future Events',
                            bgIsAsset: true,
                            bgUrl: 'assets/images/future.jpeg',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const CategoryCard(
                            title: 'Past Events',
                            bgIsAsset: true,
                            bgUrl: 'assets/images/past.jpg',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Seminars/Workshops',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 165,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      itemExtent: 200,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const CategoryCard(
                            title: 'Registrations Open',
                            bgIsAsset: true,
                            bgUrl: 'assets/images/reg_open.jpeg',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const CategoryCard(
                            title: 'Future Workshops',
                            bgIsAsset: true,
                            bgUrl: 'assets/images/future.jpeg',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const CategoryCard(
                            title: 'Past Workshops',
                            bgIsAsset: true,
                            bgUrl: 'assets/images/past.jpg',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Webinars',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    height: 165,
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      itemExtent: 200,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: const CategoryCard(
                            title: 'Registrations Open',
                            bgIsAsset: true,
                            bgUrl: 'assets/images/reg_open.jpeg',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const CategoryCard(
                            title: 'Future Webinars',
                            bgIsAsset: true,
                            bgUrl: 'assets/images/future.jpeg',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const CategoryCard(
                            title: 'Past Webinars',
                            bgIsAsset: true,
                            bgUrl: 'assets/images/past.jpg',
                          ),
                        ),
                      ],
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
