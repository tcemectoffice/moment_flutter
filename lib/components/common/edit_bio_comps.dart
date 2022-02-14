import 'package:flutter/material.dart';

class Fields extends StatelessWidget {
  final String fieldName;
  final dynamic keyType;
  final dynamic actionType;
  const Fields({
    Key? key,
    required this.fieldName,
    required this.keyType,
    required this.actionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Text(
            fieldName,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                minLines: 1,
                maxLines: 20,
                keyboardType: keyType,
                textInputAction: actionType,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FieldsWithRadio extends StatelessWidget {
  final String fieldName;
  final String option1;
  final String option2;

  const FieldsWithRadio({
    Key? key,
    required this.fieldName,
    required this.option1,
    required this.option2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          fieldName,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        const Radio(value: 1, groupValue: 1, onChanged: null),
        Text(
          option1,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w400,
          ),
        ),
        const Radio(value: 1, groupValue: 0, onChanged: null),
        Text(
          option2,
          style: const TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class DropDownForCommunity extends StatefulWidget {
  const DropDownForCommunity({
    Key? key,
  }) : super(key: key);

  @override
  State<DropDownForCommunity> createState() => _DropDownForCommunityState();
}

String? value;

class _DropDownForCommunityState extends State<DropDownForCommunity> {
  List<String> items = ["MBC", "BC", "SC", "ST", "OC"];
  String dropDownVal = "MBC";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Community : ",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              // color: const Color(0XFFF6F6F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                iconSize: 35,
                isExpanded: true,
                value: dropDownVal,
                items: items.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 18),
                      ),
                      value: value,
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownVal = newValue!;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownForAdmission extends StatefulWidget {
  const DropDownForAdmission({Key? key}) : super(key: key);

  @override
  _DropDownForAdmissionState createState() => _DropDownForAdmissionState();
}

class _DropDownForAdmissionState extends State<DropDownForAdmission> {
  List<String> items = [
    "Aided",
    "Self Support",
    "Merit Management",
    "Central Govt."
  ];
  String dropDownVal = "Self Support";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          "Admission : ",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              // color: const Color(0XFFF6F6F6),
              borderRadius: BorderRadius.circular(12),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                iconSize: 35,
                isExpanded: true,
                value: dropDownVal,
                items: items.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 18),
                      ),
                      value: value,
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropDownVal = newValue!;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
