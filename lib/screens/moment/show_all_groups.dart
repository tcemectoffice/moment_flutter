// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:moment/screens/moment/groups_screen.dart';

class ShowAllGroups extends StatefulWidget {
  const ShowAllGroups({Key? key}) : super(key: key);

  @override
  State<ShowAllGroups> createState() => _ShowAllGroupsState();
}

class _ShowAllGroupsState extends State<ShowAllGroups> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GroupCard(
                    grpDp: "assets/images/tutor_ward.jpeg",
                    grpName: "Tutor Ward",
                    onpressed: () {
                      setState(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyGroupScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GroupCard(
                    grpDp: "assets/images/tutor_ward.jpeg",
                    grpName: "Mect General",
                    onpressed: () {
                      setState(
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyGroupScreen(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GroupCard(
                    grpDp: "assets/images/tutor_ward.jpeg",
                    grpName: "Tutor Ward",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GroupCard(
                    grpDp: "assets/images/tutor_ward.jpeg",
                    grpName: "Mect General",
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class GroupCard extends StatelessWidget {
  final String grpName;
  final String grpDp;
  final dynamic onpressed;
  const GroupCard({
    Key? key,
    required this.grpDp,
    required this.grpName,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10)),
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(grpDp),
            ),
            SizedBox(
              height: 10,
            ),
            FittedBox(
              child: Text(
                grpName,
                style: TextStyle(
                  fontSize: 22,
                ),
              ),
            ),
            FittedBox(
              child: Text("3rd Year"),
            ),
          ],
        ),
      ),
    );
  }
}
