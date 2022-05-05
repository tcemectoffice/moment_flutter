import 'package:flutter/material.dart';
import 'package:moment/screens/base/notifications_screen.dart';

class MomentAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MomentAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      centerTitle: true,
      title: const Text('MOMENT'),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const Notifications()),
              ),
            );
          },
          icon: const Icon(
            Icons.notifications,
          ),
        ),
      ],
    );
  }
}
