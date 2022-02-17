import 'package:flutter/material.dart';
import 'package:moment/components/common/custom_scroll_settings.dart';
import 'package:moment/components/common/text_field-field.dart';

class ParentDetails extends StatefulWidget {
  const ParentDetails({Key? key}) : super(key: key);

  @override
  _ParentDetailsState createState() => _ParentDetailsState();
}

class _ParentDetailsState extends State<ParentDetails> {
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
            "Edit Parent's Details",
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
                                "Father's Details",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
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
                            FieldsWithTextField(
                              fieldName: "E-mail : ",
                              keyType: TextInputType.emailAddress,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithTextField(
                              fieldName: "Occupation : ",
                              keyType: TextInputType.name,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithTextField(
                              fieldName: "Occupation type : ",
                              keyType: TextInputType.name,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithTextField(
                              fieldName: "Annual Income : ",
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
                                "Mother's Details",
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
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
                            FieldsWithTextField(
                              fieldName: "E-mail : ",
                              keyType: TextInputType.emailAddress,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithTextField(
                              fieldName: "Occupation : ",
                              keyType: TextInputType.name,
                              actionType: TextInputAction.next,
                              minLines: 1,
                            ),
                            FieldsWithTextField(
                              fieldName: "Occupation type : ",
                              keyType: TextInputType.name,
                              actionType: TextInputAction.done,
                              minLines: 1,
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
