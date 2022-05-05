import 'package:flutter/material.dart';
import 'package:moment/components/common/server_image.dart';
import 'package:moment/screens/moment/profile_screen.dart';

class ProfileCard extends StatelessWidget {
  final String userName, userDp;
  final int userId;
  const ProfileCard({
    Key? key,
    required this.userName,
    required this.userDp,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Profile(
              userId: userId,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(8.0, 20.0, 4.0, 20.0),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.transparent,
                    backgroundImage: serverImageProvider(userDp),
                  ),
                ),
              ),
              Expanded(
                flex: 11,
                child: Stack(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 4),
                          child: Text(
                            userName,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.only(right: 20, top: 5),
                        alignment: Alignment.bottomRight,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
