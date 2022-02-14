import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/common/edit_bio_comps.dart';

class GeneralDetails extends StatefulWidget {
  const GeneralDetails({Key? key}) : super(key: key);

  @override
  State<GeneralDetails> createState() => _GeneralDetailsState();
}

class _GeneralDetailsState extends State<GeneralDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomScrollConfig(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      const Text(
                        "Edit General Details",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        "Save",
                        style: TextStyle(color: Colors.blue, fontSize: 24),
                      )
                    ],
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(15)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        // height: 300,
                        child: Column(
                          children: const [
                            Fields(
                              fieldName: "Name : ",
                              keyType: TextInputType.name,
                              actionType: TextInputAction.next,
                            ),
                            Fields(
                              fieldName: "Mobile : ",
                              keyType: TextInputType.number,
                              actionType: TextInputAction.next,
                            ),
                            FieldsWithRadio(
                                fieldName: "Gender : ",
                                option1: "Male",
                                option2: "Female"),
                            Fields(
                              fieldName: "D.O.B. : ",
                              keyType: TextInputType.text,
                              actionType: TextInputAction.next,
                            ),
                            Fields(
                              fieldName: "Reg No : ",
                              keyType: TextInputType.text,
                              actionType: TextInputAction.next,
                            ),
                            Fields(
                              fieldName: "Roll No : ",
                              keyType: TextInputType.text,
                              actionType: TextInputAction.next,
                            ),
                            FieldsWithRadio(
                              fieldName: "Degree : ",
                              option1: "B.E.",
                              option2: "B.Tech",
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: DropDownForAdmission(),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: DropDownForCommunity(),
                            ),
                            Fields(
                              fieldName: "Religion : ",
                              keyType: TextInputType.text,
                              actionType: TextInputAction.next,
                            ),
                            Fields(
                              fieldName: "Blood Group : ",
                              keyType: TextInputType.text,
                              actionType: TextInputAction.next,
                            ),
                            Fields(
                              fieldName: "Address : ",
                              keyType: TextInputType.streetAddress,
                              actionType: TextInputAction.done,
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
        ),
      ),
    );
  }
}
