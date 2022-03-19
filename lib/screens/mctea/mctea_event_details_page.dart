import 'package:flutter/material.dart';
import 'package:moment/components/mctea/Event_details_card.dart';
import 'package:moment/models/constants.dart' as constants;

class EventDetails extends StatelessWidget {
  const EventDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Scaffold(
            body: Container(
              height: 200,
              width: double.infinity,
              child: const Image(
                image: AssetImage(constants.tceLogoAssetURL),
              ),
            ),
          ),
        ),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: Colors.black,
                      ),
                      Flexible(child: Container(), flex: 2),
                      MaterialButton(
                        color: const Color(0xFF008EFC),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {},
                        child: const Text("Register"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  width: 213,
                  height: 35,
                  child: const Center(
                      child: FittedBox(
                    child: Text(
                      'Machine Learning',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  )),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      )),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 34,
                            horizontal: 22,
                          ),
                          child: EventDetailsCard(
                            coOrdinatorsList: ["Kishore L"],
                            eventDate: "10/03/2022",
                            lastDate: "10/03/2022",
                            membersCount: 31,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
