import 'package:flutter/material.dart';

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
