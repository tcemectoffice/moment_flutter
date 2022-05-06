import 'package:flutter/material.dart';
import 'package:moment/components/common/server_image.dart';

class SearchEntityCard extends StatelessWidget {
  final String name;
  final String dp;
  final Function()? onpressed;
  const SearchEntityCard({
    Key? key,
    required this.name,
    required this.dp,
    this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Card(
        elevation: 1,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: serverImageProvider(dp),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}