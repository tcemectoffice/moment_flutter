import 'package:flutter/material.dart';
import 'package:moment/components/common/server_image.dart';
import 'package:moment/models/group_model.dart';

class GroupCard extends StatelessWidget {
  final Group group;
  final Function()? onpressed;
  const GroupCard({
    Key? key,
    required this.group,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        elevation: 8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: serverImageProvider(group.groupdp),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                group.groupname,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
