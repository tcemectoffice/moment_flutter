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
                        const EdgeInsets.symmetric(horizontal: 1, vertical: 20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
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
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 7),
                              child: Datepicker(fieldName: "D.O.B. : "),
                            ),
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
                                fieldName: "Admission : ",
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
                                fieldName: "Community : ",
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
                              actionType: TextInputAction.newline,
                              minLines: 5,
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                "Other Details",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                            DropdownMenu(
                                fieldName: "First Graduate : ",
                                items: ["Yes", "No"],
                                defVal: "Yes"),
                            DropdownMenu(
                                fieldName: "Physically Challenged : ",
                                items: ["Yes", "No"],
                                defVal: "Yes"),
                            DropdownMenu(
                                fieldName: "Scholarship : ",
                                items: ["Yes", "No"],
                                defVal: "Yes"),
                            DropdownMenu(
                                fieldName: "Educational Loan : ",
                                items: ["Yes", "No"],
                                defVal: "Yes"),
                            DropdownMenu(
                                fieldName: "Hostel : ",
                                items: ["Hostel", "Day scholar"],
                                defVal: "Hostel"),
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
