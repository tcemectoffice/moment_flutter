import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/common/drop_down_menu-fields.dart';
import 'package:moment/components/common/text_field-field.dart';
import 'package:moment/components/common/radio-field.dart';
import 'package:moment/components/common/date_picker.dart';

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              IconData(
                0xf572,
                fontFamily: 'MaterialIcons',
                matchTextDirection: true,
              ),
              size: 30,
            ),
            onPressed: () {
              setState(
                () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          title: const Text(
            "Edit General Details",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Save",
                style: TextStyle(color: Colors.blue, fontSize: 24),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: CustomScrollConfig(
            child: SingleChildScrollView(
              child: Column(
                children: [
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
                            FieldsWithTextField(
                              fieldName: "Name : ",
                              keyType: TextInputType.name,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithTextField(
                              fieldName: "Mobile : ",
                              keyType: TextInputType.number,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithRadio(
                                fieldName: "Gender : ",
                                option1: "Male",
                                option2: "Female"),
                            Datepicker(fieldName: "D.O.B."),
                            FieldsWithTextField(
                              fieldName: "Reg No : ",
                              keyType: TextInputType.text,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithTextField(
                              fieldName: "Roll No : ",
                              keyType: TextInputType.text,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithRadio(
                              fieldName: "Degree : ",
                              option1: "B.E.",
                              option2: "B.Tech",
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: DropdownMenu(
                                items: [
                                  "Aided",
                                  "Self Support",
                                  "Merit Management",
                                  "Central Govt."
                                ],
                                defVal: "Self Support",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: DropdownMenu(
                                items: ["MBC", "BC", "SC", "ST", "OC"],
                                defVal: "BC",
                              ),
                            ),
                            FieldsWithTextField(
                              fieldName: "Religion : ",
                              keyType: TextInputType.text,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithTextField(
                              fieldName: "Blood Group : ",
                              keyType: TextInputType.text,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithTextField(
                              fieldName: "Address : ",
                              keyType: TextInputType.streetAddress,
                              actionType: TextInputAction.done,
                              minLines: 5,
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
