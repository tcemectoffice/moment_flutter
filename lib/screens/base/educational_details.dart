import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/common/text_field-field.dart';
import 'package:moment/components/common/drop_down_menu-fields.dart';

class EducationDetails extends StatefulWidget {
  const EducationDetails({Key? key}) : super(key: key);

  @override
  _EducationDetailsState createState() => _EducationDetailsState();
}

class _EducationDetailsState extends State<EducationDetails> {
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
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                "SSLC Details",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                            FieldsWithTextField(
                              fieldName: "School Name : ",
                              keyType: TextInputType.name,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithTextField(
                              fieldName: "School address : ",
                              keyType: TextInputType.streetAddress,
                              actionType: TextInputAction.newline,
                              minLines: 4,
                            ),
                            FieldsWithTextField(
                              fieldName: "School Location : ",
                              keyType: TextInputType.name,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithTextField(
                              fieldName: "Year of Passing (school) : ",
                              keyType: TextInputType.number,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithTextField(
                              fieldName: "SSLC marks : ",
                              keyType: TextInputType.number,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            DropdownMenu(
                              items: ["CBSE", "State Board", "ICSE"],
                              defVal: "State Board",
                              fieldName: "School Type : ",
                            ),
                            DropdownMenu(
                                fieldName: "Medium of study : ",
                                items: ["Tamil", "English", "Hindi", "Others"],
                                defVal: "English"),
                            DropdownMenu(
                                fieldName: "12th or Diploma : ",
                                items: ["12th", "Diploma"],
                                defVal: "12th"),
                            Divider(
                              thickness: 2,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 6),
                              child: Text(
                                "TNEA Details",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                            FieldsWithTextField(
                              fieldName: "TNEA overall rank : ",
                              keyType: TextInputType.number,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithTextField(
                              fieldName: "TNEA community rank : ",
                              keyType: TextInputType.number,
                              actionType: TextInputAction.next,
                              minLines: 1,
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
