import 'package:flutter/material.dart';
import 'package:moment/models/constants.dart';

class FieldsWithTextField extends StatelessWidget {
  final String fieldName;
  final dynamic keyType;
  final dynamic actionType;
  final int minLines;
  const FieldsWithTextField({
    Key? key,
    required this.fieldName,
    required this.keyType,
    required this.actionType,
    required this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        children: [
          Text(
            fieldName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: TextFormField(
              minLines: minLines,
              maxLines: 20,
              keyboardType: keyType,
              textInputAction: actionType,
              decoration: textFieldDecoration(),
            ),
          ),
        ],
      ),
    );
  }
}
