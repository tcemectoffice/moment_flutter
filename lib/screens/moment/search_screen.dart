import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/models/constants.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                hintText: 'search',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          const DpCard(),
          const DpCard(),
          const DpCard(),
        ],
      ),
    );
  }
}

class DpCard extends StatelessWidget {
  const DpCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 14),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 25,
              backgroundImage: AssetImage(tceLogoAssetURL),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 17),
              child: Text(
                "19F022 - Kishore L",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Flexible(child: Container()),
          ],
        ),
      ),
    );
  }
}
