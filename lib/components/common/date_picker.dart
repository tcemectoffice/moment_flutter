import 'package:flutter/material.dart';

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
      return "Select Date";
    }
    return "${date!.day}/${date!.month}/${date!.year}";
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
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
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: MaterialButton(
            child: Text(
              selectedDate(),
              style: const TextStyle(fontSize: 18),
            ),
            onPressed: () {
              pickDate(context);
            },
          ),
        ),
      ],
    );
  }
}
