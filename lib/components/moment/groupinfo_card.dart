import 'package:flutter/material.dart';

class GrpInfoCard extends StatelessWidget {
  final String grpName;
  final int batchNumber;
  final String creatorName;

  const GrpInfoCard({
    Key? key,
    required this.grpName,
    required this.batchNumber,
    required this.creatorName,
  }) : super(key: key);

  final int noOfMembers = 33;
  final String joinStatus = "Joined";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.07,
        left: MediaQuery.of(context).size.width * 0.03,
        right: MediaQuery.of(context).size.width * 0.03,
      ),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 34,
                  backgroundImage: AssetImage("images/image.jpg"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "$grpName - Batch $batchNumber",
                          style: TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            "Created by : ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            creatorName,
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "$noOfMembers members",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.23,
                          ),
                          Text(
                            joinStatus,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
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
