import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:moment/components/moment/post_card.dart';
import 'package:moment/components/moment/groupinfo_card.dart';
import 'package:moment/components/moment/addpost_in_groupspage.dart';

class MyGroupScreen extends StatelessWidget {
  const MyGroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            backgroundColor: Color(0xFFF4F4F4),
            body: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.15),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color(0xFFC9E6FB),
                ),
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  GrpInfoCard(
                    grpName: "Tutor Name",
                    batchNumber: 1,
                    creatorName: "Mr.S.Partha Sarathi",
                  ),
                  AddPostInGrpsPage(
                    userName: "19F022-Kishore L",
                    dpUrl: "images/image.jpg",
                  ),
                  const PostCard(
                    grpdpUrl: "images/image.jpg",
                    groupName: "Tutor Ward",
                    tutorName: "Mr.S.Partha sarathi",
                    batchNum: 1,
                    postMsg:
                        "All Students of batch 2 are asked to join the tutor ward meeting by 8pm today",
                    imageUrl: "images/image.jpg",
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
