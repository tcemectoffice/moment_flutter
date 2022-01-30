import 'package:flutter/material.dart';
import 'package:moment/components/moment/private_staff_selection_popup.dart';

class SelectTutorScreen extends StatelessWidget {
  const SelectTutorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFDAEDFB),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: 30, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(
                            IconData(0xf572,
                                fontFamily: 'MaterialIcons',
                                matchTextDirection: true),
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
                      elevation: 8,
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
