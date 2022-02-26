import 'package:flutter/material.dart';
import 'package:moment/models/constants.dart';

class Datepicker extends StatefulWidget {
  final String fieldName;
  const Datepicker({
    Key? key,
    required this.fieldName,
  }) : super(key: key);

  @override
  _DatepickerState createState() => _DatepickerState();
}

class _DatepickerState extends State<Datepicker> {
  DateTime? date;

  String selectedDate() {
    if (date == null) {
      return "Select a Date";
    }
    String dateSelected = date!.day >= 10 ? "${date!.day}" : "0${date!.day}";
    String monthSelected =
        date!.month >= 10 ? "${date!.month}" : "0${date!.month}";

    return "$dateSelected/$monthSelected/${date!.year}";
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1950),
      lastDate: initialDate,
    );
    if (newDate == null) {
      return;
    }
    setState(() {
      date = newDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.fieldName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                pickDate(context);
              });
            },
            child: TextFormField(
              minLines: 1,
              maxLines: 20,
              decoration: textFieldDecoration().copyWith(
                hintText: selectedDate(),
              ),
              enabled: false,
            ),
          ),
        ),
      ],
    );
  }
}
/*Material(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(20.0),
            child: MaterialButton(
              child: Text(
                selectedDate(),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                pickDate(context);
              },
            ),
          ),*/