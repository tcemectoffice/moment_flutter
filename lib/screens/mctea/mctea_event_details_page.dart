import 'package:flutter/material.dart';
import 'package:moment/components/mctea/Event_details_card.dart';
import 'package:moment/models/constants.dart' as constants;
import 'package:moment/components/mctea/questions_card.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({
    Key? key,
  }) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  bool showQuestionBox = true;

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
                      const EdgeInsets.only(right: 13, top: 10, bottom: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 25,
                          // color: Colors.black,
                        ),
                      ),
                      Flexible(child: Container(), flex: 2),
                      MaterialButton(
                        color: const Color(0xFF008EFC),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          setState(() {});
                        },
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
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Padding(
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
                          if (showQuestionBox)
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 17),
                                  child: Image(
                                    height: 146,
                                    width: 148,
                                    image:
                                        AssetImage("assets/images/think.jpeg"),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text(
                                        "Do you have any Queries?",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            showQuestionBox = !showQuestionBox;
                                          });
                                        },
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 5),
                                          child: Text(
                                            "Raise a query",
                                            style: TextStyle(
                                              fontSize: 13,
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          if (!showQuestionBox)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFFA7D5FF),
                                      Color(0xFFEAF6FE),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 20,
                                    horizontal: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      TextFormField(
                                        style: const TextStyle(fontSize: 12),
                                        minLines: 1,
                                        maxLines: 20,
                                        decoration: const InputDecoration(
                                          hintText: 'Ask your Question here',
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 10),
                                        child: Text(
                                          "Submit",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 22, vertical: 30),
                            child: ShowQuestions(),
                          ),
                        ],
                      ),
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
