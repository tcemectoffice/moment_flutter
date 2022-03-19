// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:moment/models/constants.dart';
import 'package:moment/screens/mctea/mctea_event_details_page.dart';

class McteaHome extends StatefulWidget {
  const McteaHome({Key? key}) : super(key: key);

  @override
  State<McteaHome> createState() => _McteaHomeState();
}

class _McteaHomeState extends State<McteaHome> {
  double elevation1 = 30;
  double elevation2 = 0;
  double elevation3 = 0;
  Color colour1 = Colors.white;
  Color colour2 = Colors.transparent;
  Color colour3 = Colors.transparent;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: Container(
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 19),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              // behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  elevation1 = 30;
                                  elevation2 = 0;
                                  elevation3 = 0;
                                  colour1 = Colors.white;
                                  colour2 = Colors.transparent;
                                  colour3 = Colors.transparent;
                                });
                              },
                              child: Material(
                                elevation: elevation1,
                                color: Colors.transparent,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: colour1,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      )),
                                  child: Center(
                                      child: Text(
                                    "Ongoing",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  elevation1 = 0;
                                  elevation2 = 30;
                                  elevation3 = 0;
                                  colour1 = Colors.transparent;
                                  colour2 = Colors.white;
                                  colour3 = Colors.transparent;
                                });
                              },
                              child: Material(
                                elevation: elevation2,
                                color: Colors.transparent,
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: colour2,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      )),
                                  child: Center(
                                      child: Text(
                                    "Upcoming",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  )),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  elevation1 = 0;
                                  elevation2 = 0;
                                  elevation3 = 30;
                                  colour1 = Colors.transparent;
                                  colour2 = Colors.transparent;
                                  colour3 = Colors.white;
                                });
                              },
                              child: Material(
                                elevation: elevation3,
                                color: Colors.transparent,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: colour3,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      )),
                                  height: 50,
                                  child: Center(
                                      child: Text(
                                    "Registered",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  )),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // height: 450,
                      padding: EdgeInsets.only(left: 14, top: 12),
                      color: Colors.white,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Webinars",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 7),
                                    child: AssociationCard(
                                        eventName: "CAD",
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EventDetails(),
                                              ),
                                            );
                                          });
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 7),
                                    child: AssociationCard(
                                        eventName: "Machine Learning",
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EventDetails(),
                                              ),
                                            );
                                          });
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 7),
                                    child: AssociationCard(
                                        eventName: "AI for Everyone",
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EventDetails(),
                                              ),
                                            );
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "Workshops",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 7),
                                    child: AssociationCard(
                                        eventName: "Machine Learning",
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EventDetails(),
                                              ),
                                            );
                                          });
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 7),
                                    child: AssociationCard(
                                        eventName: "Machine Learning",
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EventDetails(),
                                              ),
                                            );
                                          });
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 7),
                                    child: AssociationCard(
                                        eventName: "Machine Learning",
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EventDetails(),
                                              ),
                                            );
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            "Events",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 7),
                                    child: AssociationCard(
                                        eventName: "Machine Learning",
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EventDetails(),
                                              ),
                                            );
                                          });
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 7),
                                    child: AssociationCard(
                                        eventName: "Machine Learning",
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EventDetails(),
                                              ),
                                            );
                                          });
                                        }),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 7),
                                    child: AssociationCard(
                                        eventName: "Machine Learning",
                                        onTap: () {
                                          setState(() {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    EventDetails(),
                                              ),
                                            );
                                          });
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}

class AssociationCard extends StatefulWidget {
  final onTap;
  final String eventName;
  const AssociationCard({
    Key? key,
    required this.onTap,
    required this.eventName,
  }) : super(key: key);

  @override
  _AssociationCardState createState() => _AssociationCardState();
}

class _AssociationCardState extends State<AssociationCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        children: [
          Container(
            width: 200,
            height: 140,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image(
              image: AssetImage(appLogoAssetURL),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 200,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(widget.eventName),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
