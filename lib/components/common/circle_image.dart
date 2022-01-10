import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final bool isAsset;
  final String imgUrl;
  final double radius;
  final bool addPadding;
  const CircleImage(
      {Key? key,
      required this.isAsset,
      required this.imgUrl,
      required this.radius,
      required this.addPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: addPadding
          ? const EdgeInsets.symmetric(horizontal: 20)
          : EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(45.0),
        child: isAsset
            ? Image.asset(
                imgUrl,
                height: radius,
                fit: BoxFit.fitHeight,
              )
            : Image.network(
                imgUrl,
                height: radius,
              ),
      ),
    );
  }
}
