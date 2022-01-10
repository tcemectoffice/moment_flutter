import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title, bgUrl;
  final bool bgIsAsset;

  const CategoryCard(
      {Key? key,
      required this.title,
      required this.bgIsAsset,
      required this.bgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 180,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: bgIsAsset
              ? AssetImage(bgUrl)
              : NetworkImage(bgUrl) as ImageProvider,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.75), BlendMode.dstATop),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
