import 'package:flutter/material.dart';
import 'package:moment/screens/base/edit_bio_options_screen.dart';

class BioCardScreen extends StatefulWidget {
  const BioCardScreen({Key? key}) : super(key: key);

  @override
  _BioCardScreenState createState() => _BioCardScreenState();
}

class _BioCardScreenState extends State<BioCardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 18),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(20)),
            elevation: 4,
            child: Expanded(
              child: Container(
                // height: 500,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                        icon: const Icon(
                          IconData(
                            0xf572,
                            fontFamily: 'MaterialIcons',
                            matchTextDirection: true,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage("assets/images/app_icon.png"),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "Kishore L - 19F022",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(
                              () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const EditBioOptions(),
                                  ),
                                );
                              },
                            );
                          },
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Icon(Icons.edit),
                              ),
                              Text(
                                "Edit Bio",
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 15),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Divider(
                        thickness: 1,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Column(
                        children: const [
                          BioParameters(
                            fieldName: "Year :",
                            fieldVal: "3rd",
                          ),
                          BioParameters(
                            fieldName: "Batch :",
                            fieldVal: "2019 - 2023",
                          ),
                          BioParameters(
                            fieldName: "Email :",
                            fieldVal: "kishorel@student.tce.edu",
                          ),
                          BioParameters(
                            fieldName: "Tutor :",
                            fieldVal: "Mr.Partha Sarathi S",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BioParameters extends StatelessWidget {
  final String fieldName;
  final String fieldVal;
  const BioParameters({
    Key? key,
    required this.fieldName,
    required this.fieldVal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Text(
            fieldName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            fieldVal,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
