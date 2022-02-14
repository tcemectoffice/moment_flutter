import 'package:flutter/material.dart';
import 'package:moment/components/moment/private_staff_selection_popup.dart';

class SelectTutorScreen extends StatefulWidget {
  const SelectTutorScreen({Key? key}) : super(key: key);

  @override
  State<SelectTutorScreen> createState() => _SelectTutorScreenState();
}

class _SelectTutorScreenState extends State<SelectTutorScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: 30, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                Navigator.pop(context);
                              });
                            },
                            child: const Icon(
                              IconData(
                                0xf572,
                                fontFamily: 'MaterialIcons',
                                matchTextDirection: true,
                              ),
                              size: 30,
                            ),
                          ),
                        ),
                        Text(
                          "Add a Tutor",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: const Text(
                        "Done",
                        style: TextStyle(fontSize: 20, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 10),
                        child: StaffRowTile(
                          staffName: "Mr.S.Partha Sarathi",
                          staffTitle: "Assistant Professor",
                          isPopUp: false,
                        ),
                      ),
                    ),
                  );
                },
                childCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
