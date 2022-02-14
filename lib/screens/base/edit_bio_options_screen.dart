import 'package:flutter/material.dart';

class EditBioOptions extends StatefulWidget {
  const EditBioOptions({Key? key}) : super(key: key);

  @override
  State<EditBioOptions> createState() => _EditBioOptionsState();
}

class _EditBioOptionsState extends State<EditBioOptions> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      IconData(
                        0xf572,
                        fontFamily: 'MaterialIcons',
                        matchTextDirection: true,
                      ),
                      size: 30,
                    ),
                    onPressed: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Edit bio",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              OptionsCard(
                dp: "assets/images/tutor_ward.jpeg",
                name: "General Details",
                onpressed: () {
                  setState(() {
                    Navigator.pushNamed(context, '/general-details');
                  });
                },
              ),
              OptionsCard(
                dp: "assets/images/tutor_ward.jpeg",
                name: "Parent Details",
                onpressed: () {
                  setState(() {});
                },
              ),
              OptionsCard(
                dp: "assets/images/tutor_ward.jpeg",
                name: "High School Education Details",
                onpressed: () {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OptionsCard extends StatelessWidget {
  final String dp;
  final String name;
  final dynamic onpressed;

  const OptionsCard({
    Key? key,
    required this.dp,
    required this.name,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
      child: GestureDetector(
        onTap: onpressed,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusDirectional.circular(15)),
          elevation: 4,
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(dp),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(name,
                          style: const TextStyle(
                              fontSize: 23, fontWeight: FontWeight.w500)),
                    ),
                  ),
                  const Icon(Icons.navigate_next),
                ],
              )),
        ),
      ),
    );
  }
}
